class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create customer_params
    if @customer.save
      flash[:success] = "Created account successfully"
      redirect_to @customer
    else
      render :new
    end
  end

  def show

  end

  private

  def customer_params
    params.require(:customer).permit :name, :email, :password, :password_confirmation,
      :address, :city, :state, :country
  end
end
