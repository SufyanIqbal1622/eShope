class OrdersController < ApplicationController
 def show
    @order = @current_order
  end
  def add_quantity
  @order_item = OrderItem.find(params[:id])
  @order_item.quantity += 1
  @order_item.save
  redirect_to order_path(@current_order)
end

def reduce_quantity
  @order_item = OrderItem.find(params[:id])
  if @order_item.quantity > 1
    @order_item.quantity -= 1
  end
  @order_item.save
  redirect_to order_path(@current_order)
end

  def destroy
    @order = @current_order
    @order.destroy
    session[:order_id] = nil
    redirect_to root_path
  end
end
