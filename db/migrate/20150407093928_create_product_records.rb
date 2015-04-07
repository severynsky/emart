class CreateProductRecords < ActiveRecord::Migration
  def change
    create_table :product_records do |t|
      t.references :product, index: true
      t.belongs_to :cart, index: true

      t.timestamps null: false
    end
    add_foreign_key :product_records, :products
    add_foreign_key :product_records, :carts
  end
end
