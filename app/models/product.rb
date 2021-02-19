class Product < ApplicationRecord
  attr_accessor :remove_main_image
  belongs_to :category
  has_one_attached :image

  validates :name, length:{minimum: 3}
  validates :price, presence: true

#   before_validation :before_validation_fun
#   after_validation :after_validation_fun

#   before_update :before_update_fun
#   # around_update :around_update_fun
#   after_update :after_update_fun

#   before_create :before_create_fun
#   # around_create :around_create_fun
   after_create  :after_create_fun

#   before_save :before_save_fun
#   # around_save :around_save_fun
#   after_save :after_save_fun

#   before_destroy :before_destroy_fun
#   # around_destroy :around_destroy_fun
#    after_destroy :after_destroy_fun

#   after_commit :after_commit_fun
#   after_rollback :after_rollback_fun

#   def before_validation_fun
#       puts "++==" * 50
#     puts " Before validatin"
#   end

#   def after_validation_fun
#       puts "++==" * 50
#     puts "After validating"
#   end

#   def before_save_fun
#       puts "++==" * 50
#     puts " Before save "
#   end

#   def around_save_fun
#     puts "++==" * 50
#     puts "around save "
#   end

#   def after_save_fun
#       puts "++==" * 50
#     puts " After Save "
#   end

#   def before_create_fun
#       puts "++==" * 50
#     puts "Before Creating an Product"
#   end

#   def around_create_fun
#     puts "--"*50
#     puts "Around Creating an Product "
#   end

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

#   def before_update_fun
#     puts "++"*50
#     puts "Before updating a product"
#   end

#   def around_update_fun
#   puts "++*"*50
#   puts "Product in Updating "
#   end

#   def after_update_fun
#   puts "++==" * 100
#   puts "Product Successfuly updated"
#   end

#   def before_destroy_fun
#   puts "++*"
#   puts "Before Destory"
#   end

#   def around_destroy_fun
#     puts "++==" * 100
#   puts " Around Destroy"
#   end

#   def after_destroy_fun
#     puts "++==" * 100
#   puts " After Destroy "
#   end

#   def after_commit_fun
#     puts "++==" * 100
#   puts" After Commit "
#   end

#   def after_rollback_fun
#     puts "++==" * 100
#   puts "After Rollback"
#   end
 end

