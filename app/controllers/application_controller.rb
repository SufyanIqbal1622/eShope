class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
protect_from_forgery with: :exception
before_action :current_order

around_action :around_actionn_fun



protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      :email,
      :phone_number,
      :address_city,
      :address_country,
      :address_line,
      :card_number,
      :card_type,
      :cvc,
      :expires_month,
      :expires_year,
      :password,
      :card_type,
      ])
    devise_parameter_sanitizer.permit(:account_update, keys:[
      :name,
      :email,
      :phone_number,
      :address,
      :password,
      :address_city,
      :address_country,
      :address_line,
      :card_number,
      :card_type,
      :cvc,
      :expires_month,
      :expires_year,
      :current_password
      ])
  end


  private

    def around_actionn_fun
      puts "==="*30
      yield
      puts "==="*30
    end

    def current_order
      if session[:order_id]
        order = Order.find_by(:id => session[:order_id])
        if order.present?
          @current_order = order
        else
          session[:order_id] = nil
        end
      end

      if session[:order_id] == nil
        @current_order = Order.create
        session[:order_id] = @current_order.id
      end
    end
end
