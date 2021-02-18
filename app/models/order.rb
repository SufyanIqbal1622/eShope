class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  before_save :is_empty_fun
  after_create :created_fun
  after_update :update_fun
  around_save :aroundssav_fun

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

  def is_empty_fun
     puts "=*="*50
    puts order_items.length

  end

  def update_fun
    puts "=="*50
    puts "Your order is updated"
  end

  def created_fun
     puts "=="*50
    puts "Your order is created and this item is alson added to your cart  "
  end

  def aroundsv_fun
    puts "****"*50
    puts "Your order in saving process"
  end
end
