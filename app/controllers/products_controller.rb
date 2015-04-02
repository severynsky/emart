class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :find_categories

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
    @categories = Category.all
    if @product.image_id == nil
      @image = @product.create_image
    end
  end

  def update
    if @product.update(product_params)
      binding.pry
      redirect_to @product, notice: "product has been updated"
    end
  end

  def index
    @products = Product.all
  end

  def destroy
    @product.destroy
    flash[:notice] = "You have successfully delete the product."
    redirect_to 'products#index'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :sku, :category_id, image_attributes: [:path, :id])
  end

  def find_product
    @product = Product.find(params[:id])
  end
  def find_categories
    @categories = Category.all
  end
end
