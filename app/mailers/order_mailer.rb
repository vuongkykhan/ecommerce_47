class OrderMailer < ApplicationMailer

  def create_order current_user, order
    @user = current_user
    @order = order

    mail to: @user.email, subject: I18n.t("order_mailer.subject")
  end

  def cancel_order current_user, order
    @user = current_user
    @order = order

    mail to: @user.email, subject: I18n.t("order_mailer.subject")
  end

  def approve_order order
    @order = order
    @user = @order.user

    mail to: @user.email, subject: I18n.t("order_mailer.subject")
  end

  def reject_order order
    @order = order
    @user = @order.user

    mail to: @user.email, subject: I18n.t("order_mailer.subject")
  end
end
