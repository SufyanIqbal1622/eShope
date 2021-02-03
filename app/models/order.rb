class Order < ApplicationRecord
  belongs_to :cart_item
  belongs_to :product
end
