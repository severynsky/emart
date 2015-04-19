class Cart < ActiveRecord::Base
	has_many :product_records

  def total_cart_price
    arr = []
    product_records.each do |prod|
      arr << prod.total_price
    end
    cart_total = arr.inject {|total, el| total + el}
  end

end
