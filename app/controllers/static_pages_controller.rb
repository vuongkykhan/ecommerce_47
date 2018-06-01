class StaticPagesController < ApplicationController
  before_action :load_categories, only: :home

  def home
    @products = Product.load_product.order_by_id
      .paginate page: params[:page], per_page: Settings.paginate.per_page
    @categories = Category.all
  end

  def about; end

  def contact; end

  def help; end

  def show; end

  def cart; end
end
