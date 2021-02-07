class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def create
  @cart = Cart.new(cart_params)
  @current_order.order_items.each do |item|
    @cart.order_items << item
    item.order_id = nil
  end
  @cart.save
  Order.destroy(session[:order_id])
  session[:order_id] = nil
  redirect_to root_path
end

private
  def cart_params
    params.require(:cart).permit(:name, :email, :address, :pay_method)
  end

end
