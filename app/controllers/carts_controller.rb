class CartsController < ApplicationController

  before_action :find_cart, only: [:show, :edit, :update, :destroy]
  def show
    # binding.pry
  end

  def index
    @cart = Cart.all
  end

  def destroy
    binding.pry
    @cart.product_records.delete_all
    flash[:notice] = "You have successfully delete the product."
    redirect_to 'products#index'
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end
end
