class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper
  include UsersHelper

  def valid_object object
    render file: "public/404.html", status: 404, layout: true unless object
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".login_required"
      redirect_to signin_url
    end
  end

  def logged_at_admin
    unless is_admin?
      flash[:danger] = t ".login_required"
      redirect_to signin_url
    end
  end

  def current_cart
    @producs_of_current_cart = Product.load_product_by_ids session[:cart].keys
  end

  def quantity_in_cart
    @producs_of_current_cart.each do |item|
      item.quantity_in_cart = session[:cart][item.id.to_s]
    end
  end

  def load_categories
    @categories = Category.all
  end
end
