class StaticPagesController < ApplicationController
  def home
    @products = Product.all
  end

  def about; end

  def contact; end

  def help; end

  def show; end

  def cart; end
end
