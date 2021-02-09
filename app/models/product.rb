class Product < ApplicationRecord
  attr_accessor :remove_main_image
  belongs_to :category
  has_one_attached :image
  # has_many :orders, through: :product
end

