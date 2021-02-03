class CartItem < ApplicationRecord
  belongs_to :product
  has_many :orders
end
