class ProductRecord < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
    quantity * product.price
  end
end
