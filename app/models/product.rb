class Product < ApplicationRecord
  attr_accessor :remove_main_image
  belongs_to :category
  has_one_attached :image

  validates :name, length:{minimum: 3}
  validates :price, presence: true
  after_create  :after_create_fun

  def after_create_fun

    Stripe::Product.create({id: "myfirstapp#{id}", type: 'good', name: name})

    Stripe::SKU.create({
      id:"sku#{id}",
      price: price.to_i,
      currency: "usd",
      inventory: {type: 'finite', quantity: quantity},
      product: "myfirstapp#{id}",
    })

  end
 end

