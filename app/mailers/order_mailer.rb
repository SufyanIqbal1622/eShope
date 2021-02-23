class OrderMailer < ApplicationMailer
 default from: 'sufyaniqbal1622@gmail.com'
  layout 'mailer'

  def new_order_email(current_user)
    @user = current_user
    mail(to: @user.email, subjec.t: "Welcome #{ @user.name}")
  end

end
