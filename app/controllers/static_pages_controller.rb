class StaticPagesController < ApplicationController
  def home
    @products = Product.load_product.order_by_id
      .paginate page: params[:page], per_page: Settings.paginate.per_page
  end

  def about; end

  def contact; end

  def help; end

  def show; end

  def cart; end
end
