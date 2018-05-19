class CategoriesController < ApplicationController
  before_action :find_category, only: %i(show update edit destroy)

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_pamrams
    if @category.save
      flash[:success] = t ".create_success"
      redirect_to categories_url
    else
      render :new
    end
  end

  def update
    if @category.update category_pamrams
      flash[:success] = t ".update_success"
      redirect_to categories_url
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url
  end

  private

  def category_pamrams
    params.require(:category).permit :name
  end

  def find_category
    @category = Category.find_by id: params[:id]
  end
end
