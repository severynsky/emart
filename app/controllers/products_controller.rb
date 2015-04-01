class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product has been created!'
    else
      render 'new'
    end
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

  def product_params
    params.require(:product).permit(:title, :description, :price, :sku)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
