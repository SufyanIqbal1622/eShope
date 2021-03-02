class ChargesController < ApplicationController
before_action :check_cart

  def create
   @amount = current_user.cart.sub_total
    @charge = Stripe::Charge.create({
      amount: @amount,
      description: 'Order Decription',
      source: params[:stripeToken],
      currency: 'usd',
    })
    if @charge.paid && @charge.amount == @amount
      @order.order_status = @order.order_status.to_i + 1
      if @order.save
        current_user.new_cart
        redirect_to root_path, notice: "Thank you for Shoping here for #{@order.sub_total}, you will recive an email about your Order"
      else
        redirect_to order_path(:id => current_user.cart.id),  alert: "Sorry Somthing went wrong plz try again"
      end
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to order_path(:id => current_user.cart.id),  alert: "Sorry Somthing went wrong plz try again"
  end

  private

  def check_cart
     @order = current_user.cart
      unless(@order.order_items.length > 0)
        redirect_to order_path(current_user.cart.id), alert: "Sorry. Cart is Empty!"
      end
  end
end

