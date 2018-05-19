class ProductsController < ApplicationController
  def new
    @product = Product.new
    # @categories = Category.all
    # debugger
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".create_success"
      redirect_to products_url
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit :name, :description, :unit_price, :image, :category_id
  end
end
