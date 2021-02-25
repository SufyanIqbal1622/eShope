class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  validates :name, length: { minimum: 2 }
  validates :phone_number, length: { is: 11 }
  validates :password, length: { in: 6..20 }

  before_validation :bf_validation
  after_validation :af_validation
  after_create :after_user_create

  def cart
    orders.last || orders.create
  end

  def new_cart
    orders.create
  end

  def after_user_create

    Stripe::Customer.create({
      id: "customer#{id}",
      name: "#{name}",
      email: "#{email}",
      phone: "#{phone_number}",
      shipping: {
        name: "#{name}",
        address: {
          line1: "#{address_line}",
          city: "#{address_city}",
          country: "#{address_country}",
        },
      },
    })

  end

private

  def bf_validation
    puts "There is a New User who want to Validate himself "
  end

  def af_validation
    puts " Welcome to eShope, now you are a valiud user  "
  end
end
