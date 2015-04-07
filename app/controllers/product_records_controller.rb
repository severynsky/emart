class ProductRecordsController < ApplicationController
	include CurrentCart
  before_action :set_cart, only: [:create]

  def create
  	product = Product.find(params[:product_id])
  	@cart.product_records.build(product: product).save
  end

  def destroy
  end

  private


  def product_records_params
  	# params.require(:product_records).permit(:product_id)
  end
end
