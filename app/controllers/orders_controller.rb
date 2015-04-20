class OrdersController < ApplicationController
  before_action :find_for_order, only: [:new, :create, :show]

  def new
    # binding.pry
    if !@cart.product_records.empty?
      @order = Order.new
    else
      flash[:notice] =  'You cannot create orders with empty cart!'
      redirect_to '/'
    end
  end

  def create
    # binding.pry
    @order = Order.create(user_id:@user.id)
    @order.product_records = @cart.product_records
    current_user.orders << @order
    @order.save
    @cart.product_records.delete_all
    redirect_to order_path(@order)
  end

  def show
    @order = @user.orders.find(params[:id])
    # respond_to do |format|
    #   format.js
    # end
  end

  def destroy
    binding.pry
    Order.find(params[:id]).delete
    redirect_to "users_profile", notice: "order has been deleted"
  end

  private

  def order_params
    params.require(:order).permit(:cart_id, :user_id)
  end

  def find_for_order
    @user = current_user
    @cart = Cart.find_by(id: session[:cart_id])
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
