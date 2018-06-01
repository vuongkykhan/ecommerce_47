class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper

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
end
