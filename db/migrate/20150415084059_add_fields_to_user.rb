class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :adress, :string
    add_column :users, :zip, :integer
    add_column :users, :phone, :integer
  end
end
