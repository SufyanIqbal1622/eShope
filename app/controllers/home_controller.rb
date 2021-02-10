class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all.with_attached_image
  end

  def about
  end

end
