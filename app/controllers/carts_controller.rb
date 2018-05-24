class CartsController < ApplicationController
  before_action :current_cart
  before_action :load_product, only: :index
  before_action :find_product, except: :index

  def index; end

  def add_cart
    if session[:cart].key?(@product.id.to_s)
      session[:cart][@product.id.to_s] += Settings.quantity.default
    else
      session[:cart][@product.id.to_s] = Settings.quantity.default
    end
    redirect_to root_url
  end

  private

  def find_product
    @product = Product.find_by id: params[:id_product]
    valid_object @product
  end

  def load_product
    @products = Product.load_product_by_ids session[:cart].keys
  end
end
