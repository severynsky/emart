class AddOrderIdToProductRecords < ActiveRecord::Migration
  def change
    add_column :product_records, :order_id, :integer
  end
end
