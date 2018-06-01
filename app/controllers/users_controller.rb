class UsersController < ApplicationController
  before_action :find_user, except: %i(index new create)
  before_action :logged_in_user, except: %i(show new create)

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      flash[:success] = t ".create_success"
      redirect_to @user
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t ".update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation,
      :address, :city, :phone, :country
  end

  def find_user
    @user = User.find_by id: params[:id]
    valid_object @user
  end
end
