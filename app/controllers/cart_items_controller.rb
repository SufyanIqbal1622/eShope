class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def show
    @cart_item = CartItem.find.find(params[:id])
  end



end
