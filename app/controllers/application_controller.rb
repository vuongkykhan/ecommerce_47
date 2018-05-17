class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def valid_object object
    render file: "public/404.html", status: 404, layout: true unless object
  end
end
