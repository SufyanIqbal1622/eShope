class OrderItemsController < ApplicationController
before_action :authenticate_user!
  def create
    chosen_product = Product.find(params[:product_id])
    current_order = current_user.cart
      if current_order.products.include?(chosen_product)
      @order_item = current_order.order_items.find_by(product: chosen_product)
      @order_item.quantity = @order_item.quantity.to_i + 1
    else
      @order_item = OrderItem.new
      @order_item.order = current_order
      @order_item.product = chosen_product
      @order_item.sku_id = "sku#{chosen_product.id}"
      @order_item.quantity = @order_item.quantity.to_i + 1
    end
    flash[:notice] = "#{@order_item.product.name}  added to cart."
    @order_item.save
    redirect_to root_path(current_order)
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to order_path(current_user.cart.id)
     flash[:notice] = "#{@order_item.product.name}  Removed "
  end

  def add_quantity
    @order_item = OrderItem.find(params[:id])
    @order_item.quantity = @order_item.quantity.to_i + 1
    @order_item.save
    redirect_to order_path(current_user.cart)
  end

  def reduce_quantity
    @order_item = OrderItem.find(params[:id])
    if @order_item.quantity.to_i > 1
      @order_item.quantity = @order_item.quantity.to_i - 1

    end
    @order_item.save
    redirect_to order_path(current_user.cart)
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity,:product_id, :order_id)
  end
end
