class Product < ApplicationRecord
  attr_accessor :remove_main_image
  belongs_to :category
  has_many :cart_items
  has_one_attached :image
  has_many :orders

end

