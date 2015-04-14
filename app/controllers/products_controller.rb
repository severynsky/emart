class ProductsController < ApplicationController

  include CurrentCart
  include Devise::Controllers::Helpers

  # before_action :authenticate_user!
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :find_categories, only: [:show, :edit, :update, :destroy]
  before_action :find_cart

  def new
    @product = Product.new
    @image = @product.create_image
    # binding.pry
    $show_counter = nil
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product, notice: 'Product has been created!'
    else
      render 'new'
    end
  end

  def show
    $show_counter != nil ? $show_counter += 1 : $show_counter = 1
  end

  def edit
    if @product.image == nil
      @product.create_image
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "product has been updated"
    end
  end

  def index
    @products = Product.all
    @user = current_user
    # binding.pry
  end

  def destroy
    @product.destroy
    flash[:notice] = "You have successfully delete the product."
    redirect_to 'products#index'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :sku, :category_id, image_attributes: [:picture])
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def find_cart
    @cart = Cart.find_by(id: session[:cart_id])
  end

  def find_categories
    @categories = Category.all
  end
end
