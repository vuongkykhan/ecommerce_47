module Admin
  class OrdersController < ApplicationController
    before_action :logged_at_admin
    before_action :find_order, only: %i(approve reject)
    before_action :load_orders, only: %i(index approve reject)

    def index; end

    def approve
      @order.approved!
      OrderMailer.approve_order(@order).deliver_now
      respond_to do |format|
        format.json {}
        format.js {}
      end
    end

    def reject
      @order.rejected!
      OrderMailer.reject_order(@order).deliver_now
      respond_to do |format|
        format.json {}
        format.js {}
      end
    end

    private

    def load_orders
       @orders = Order.newest.paginate page: params[:page], per_page: Settings.paginate.per_page
    end

    def find_order
      @order = Order.find_by id: params[:id_order]
      valid_object @order
    end
  end
end
