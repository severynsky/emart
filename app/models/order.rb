class Order < ActiveRecord::Base
  belongs_to :user
  has_many :product_records
end
