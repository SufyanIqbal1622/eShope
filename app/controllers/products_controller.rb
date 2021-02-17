class ProductsController < ApplicationController
# before_action :before_action_fun
#   # around_action :around_action_fun
# after_action :after_action_fun

#  prepend_before_action :prepend_before_action_fun
# #  prepend_around_action :prepend_around_action_fun
#  prepend_after_action :prepend_after_action_fun

#  append_before_action :append_before_action_fun
# #  append_around_action :append_around_action_fun
#  append_after_action :append_after_action_fun





def prepend_before_action_fun
  puts "==**"*30
  puts " prepend before action called"
end

def prepend_around_action_fun
  puts "==**"*30
  puts " prepend around action called"
end

def prepend_after_action_fun
  puts "==**"*30
  puts " prepend after action called"
end

def append_before_action_fun
  puts "==**"*30
  puts " append before action called"
end

def append_around_action_fun
  puts "==**"*30
  puts " append around action called"
end

def append_after_action_fun
  puts "==**"*30
  puts " append after action called"
end

def before_action_fun
  puts "==**"*30
  puts " before action called"
end

def around_action_fun
  puts "==**"*30
  puts " around action called"
end

def after_action_fun

  puts "==**"*30
  puts " after action called"
end

  def index
    @products = Product.all.with_attached_image
  end

  def show
    @prduct = Product.find(params[:id])
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Product.all.where("lower(name) ILIKE :search", search: @parameter)
    end
  end

  private
  def product_params
      params.require(:product).permit(:name, :price)
  end

end
