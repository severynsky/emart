class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :sku, uniqueness: true
  belongs_to :category
end
