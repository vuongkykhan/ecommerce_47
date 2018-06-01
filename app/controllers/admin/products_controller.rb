module Admin
  class ProductsController < ApplicationController
    before_action :load_products, only: :index
    before_action :find_product, except: %i(index new create)
    before_action :load_categories, except: %i(index destroy)
    before_action :load_orders_with_in_progress, only: :destroy

    def index; end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new product_params
      if @product.save
        flash[:success] = t ".create_success"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @product.update_attributes product_params
        flash[:success] = t ".edit_success"
        redirect_to admin_products_path
      else
        render :edit
      end
    end

    def destroy
      ActiveRecord::Base.transaction do
        if @orders.present?
          @orders.each do |item|
            item.rejected!
            OrderMailer.reject_order(item).deliver_now
          end
        end
        @product.inactive!
        respond_success
      end
    rescue
      respond_error
    end

    private

    def product_params
      params.require(:product).permit :category_id, :name, :description, :image, :price, :quantity
    end

    def find_product
      @product = Product.find_by id: params[:id]
      valid_object @product
    end

    def load_products
      @products = Product.active.order_by_id
        .paginate page: params[:page], per_page: Settings.paginate.per_page
    end

    def load_orders_with_in_progress
      @orders = Order.by_product_id params[:id]
    end

    def respond_error
      respond_to do |format|
        format.json{render json: {message: t ("error")},
          status: :unprocessable_entity}
        format.html{}
        format.js
      end
    end

    def respond_success
      load_products
      respond_to do |format|
        format.json{}
        format.html{}
        format.js
      end
    end
  end
end
