class OrderItem < ApplicationRecord
  belongs_to :product
  # belongs_to :cart
  belongs_to :order


  def total_price
    self.quantity.to_i * self.product.price.to_i
  end
end
