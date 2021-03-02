class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy, inverse_of: :order
  has_many :products, through: :order_items

  before_save :before_save_fun

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

  def before_save_fun
    data = []

    order_items.each do |order_item|
      data << {type: 'sku', parent: "#{order_item.sku_id}", quantity: "#{order_item.quantity}"}
    end

    if (data.length > 0)

      Stripe::Order.create({
        currency: 'usd',
        email: user.email,
        items: data,
        shipping: {
          name: user.name,
          address: {
            line1: "#{user.address_line}",
            city: "#{user.address_city}",
            country: "#{user.address_country}",
          },
        },
      })
      OrderMailer.new_order_email(user).deliver_now
    end
  end
end
