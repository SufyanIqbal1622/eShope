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
    if (@order.order_items.length > 0)
      @order.order_status = @order.order_status.to_i + 1
      if @order.save
        OrderMailer.new_order_email(current_user).deliver_now
        current_user.new_cart
        redirect_to root_path, notice: "Thank you for Shoping here, you will recive an email about your Order"
      else
        redirect_to order_path(:id => current_user.cart.id),  alert: "Sorry Somthing went wrong plz try again"
      end
    else
      redirect_to order_path(current_user.cart.id), alert: "Sorry. Cart is Empty!"
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
