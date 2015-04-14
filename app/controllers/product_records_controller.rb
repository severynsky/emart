class ProductRecordsController < ApplicationController
	include CurrentCart
  before_action :set_cart, only: [:create]

  def create
  	product = Product.find(params[:product_id])
    # binding.pry
    @product_record = @cart.product_records.find_by(product_id: (params[:product_id]))
    if @product_record != nil
      @product_record.quantity += 1
      @product_record.save
      redirect_to product_path(product), notice: 'Quantity increased!'
    else
  	  @cart.product_records.build(product: product).save
      redirect_to cart_path(session[:cart_id])
    end
  end

  def destroy
  end

  private


  def product_records_params
  	# params.require(:product_records).permit(:product_id)
  end
end
