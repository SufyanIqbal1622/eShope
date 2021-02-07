class OrdersController < ApplicationController

  def show
    @order = @current_order
  end

  def destroy
    @order = @current_order
    @order.destroy
    session[:order_id] = nil
    redirect_to root_path
  end
end
