class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def index
    @products = Product.all
  end

  def destroy
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
