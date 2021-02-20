class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders


  validate :check_length
  validate :validphonenumber

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

    Stripe::Customer.create_source(
       "customer#{id}",
         {source: "tok_#{card_type}",},
       )
  end

private
  def check_length
    unless card_number.size == 16
      errors.add(:column, "length must be 16")
    end
  end

  def validphonenumber
    number = self.phone_number.length
    if number < 11
      errors.add(:phone_number, " Complete number is require ")
    end
  end

  def bf_validation
    puts "There is a New User who want to Validate himself "
  end

  def af_validation
    puts " Welcome to eShope, now you are a valiud user  "
  end


end
