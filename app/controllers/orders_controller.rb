class OrdersController < ApplicationController


  def show
    @order = current_user.cart
  end

  def destroy
    @order = current_user.cart
    @order[:order_status] = 1
    @order.destroy
    redirect_to root_path
  end



  def proceed
    @order = current_user.cart
    @order.order_status = @order.order_status.to_i + 1
    @order.save
    current_user.new_cart
    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
