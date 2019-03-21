class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    mail(to: "gabecadiz@hotmail.com", subject:"order #{@order.id} from the jungle")
  end
end
