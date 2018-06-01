module Admin
  class OrderItemsController < ApplicationController
    before_action :load_order, :load_user, only: :index

    def index
      @order_items = OrderItem.includes(:product).find_by_order_id params[:order_id]
    end

    private

    def load_order
      @order = Order.find_by id: params[:order_id]
      valid_object @order
    end

    def load_user
      @user = @order.user
      valid_object @user
    end
  end
end
