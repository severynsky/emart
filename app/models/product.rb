class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :sku, uniqueness: true
  belongs_to :category
  has_one :image, dependent: :destroy
  accepts_nested_attributes_for :image

end
