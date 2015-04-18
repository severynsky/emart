class ProductRecordsController < ApplicationController
	include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :find_product_record, only: [:create]
  before_action :find_product_record_quantity, only: [:incr_quantity, :decr_quantity]

  def create
  	product = Product.find(params[:product_id])
    # binding.pry
    if @product_record != nil
      @product_record.quantity += 1
      @product_record.save
      redirect_to product_path(product), notice: 'Quantity increased!'
    else
  	  @cart.product_records.build(product: product).save
      # redirect_to cart_path(session[:cart_id])
      redirect_to product_path(product)
      flash[:notice] = 'Item was added to cart'
    end
  end

  def incr_quantity
    # binding.pry
    @product_record.quantity += 1
    @product_record.save
    redirect_to cart_path(@cart.id)
    flash[:notice] = "One #{@product_record.product.title} was added to cart cart"
  end

  def decr_quantity
    @product_record.quantity -= 1
    @product_record.save
    redirect_to cart_path(@cart.id)
    flash[:notice] = "One #{@product_record.product.title} was taken from cart cart"
  end

  def destroy
  end

  private

  def find_product_record_quantity
    @product_record = @cart.product_records.find(params[:product_rec_id])
  end

  def find_product_record
    @product_record = @cart.product_records.find_by(product_id: (params[:product_id]))
  end

  def product_records_params
  	# params.require(:product_records).permit(:product_id)
  end
end
