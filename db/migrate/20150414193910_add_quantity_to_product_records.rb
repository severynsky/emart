class AddQuantityToProductRecords < ActiveRecord::Migration
  def change
    add_column :product_records, :quantity, :integer, :default => 1
  end
end
