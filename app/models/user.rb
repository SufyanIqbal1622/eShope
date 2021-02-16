class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :bf_validation
  after_validation :af_validation

  validates :phone_number, presence: true
  validate :validphonenumber

  has_many :orders

  def cart
    orders.last || orders.create
  end

  def new_cart
    orders.create
  end
private

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
