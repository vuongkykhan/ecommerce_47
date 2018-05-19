class CustomersController < ApplicationController
  before_action :find_customer, only: %i(edit update show index)
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create customer_params
    if @customer.save
      flash[:success] = t ".update_success"
      redirect_to @customer
    else
      render :new
    end
  end

  def show
  end

  def edit; end

  def update
    if @customer.update customer_params
      flash[:success] = t ".update_success"
      redirect_to @customer
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit :name, :email, :password, :password_confirmation,
      :address, :city, :phone, :country
  end

  def find_customer
    @customer = Customer.find_by id: params[:id]
  end
end
