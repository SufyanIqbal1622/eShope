class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all.with_attached_image

  end

  def about
    @order = current_user.cart
    puts current_user
  end
   def header

   end

end
