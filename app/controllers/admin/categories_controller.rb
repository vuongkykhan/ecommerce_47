module Admin
  class CategoriesController < ApplicationController
    before_action :find_category, except: %i(index new create)

    def index
      @categories = Category.paginate page: params[:page]
    end

    def show; end

    def new
      @category = Category.new
    end

    def create
      @category = Category.create category_pamrams
      if @category.save
        flash[:success] = t ".create_success"
        redirect_to admin_categories_url
      else
        render :new
      end
    end

    def update
      if @category.update category_pamrams
        flash[:success] = t ".update_success"
        redirect_to admin_categories_url
      else
        render :edit
      end
    end

    def destroy
      if @category.destroy
        flash[:success] = t ".delete_success"
      else
        flash[:errors] = t ".unsucess_delete"
      end
      redirect_to categories_url
    end

    private

    def category_pamrams
      params.require(:category).permit :name,
        products_attributes: %i(id name description image price quantity)
    end

    def find_category
      @category = Category.find_by id: params[:id]
      valid_object @category
    end
  end
end
