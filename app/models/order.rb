class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  enum order_status: [:pending, :completed]

  scope :cart, -> {where("order_status = 0")}
  scope :processed, ->{where("order_status = 1")}

  def sub_total
    sum = 0
    self.order_items.each do |order_item|
      sum+= order_item.total_price
    end
    return sum
  end

  def details
    data = []
    order_items.each do |oi|
      data << [oi.product.name, oi.quantity].compact.join(' = ')
    end
    return data.to_s.humanize
  end
end
