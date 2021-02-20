class CheckoutController < ApplicationController

  def create
    Stripe::Checkout::Session.create({
      success_url: 'https://example.com/success',
      cancel_url: 'https://example.com/cancel',
      payment_method_types: ['card'],
      line_items: [
        {price: 'price_H5ggYwtDq4fbrJ', quantity: 2},
      ],
      mode: 'payment',
    })
  end

  def success

  end

  def cancel

  end

end
