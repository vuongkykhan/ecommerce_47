module Admin
  class OrdersController < ApplicationController
    def index
      @orders = Order.newest.paginate page: params[:page], per_page: Settings.paginate.per_page
    end
  end
end
