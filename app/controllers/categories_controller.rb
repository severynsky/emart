class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to @category, notice: 'Category has been created!'
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
