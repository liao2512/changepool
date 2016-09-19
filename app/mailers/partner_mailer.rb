class PartnerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.partner_mailer.partner_activation.subject
  #
  def partner_account_activation(partner)
    @partner = partner
    mail to: partner.email, subject: "Partner Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.partner_mailer.password_reset.subject
  #
  def partner_password_reset
    @greeting = "Hi"

    mail to: "to@example.org", subject: "Password reset"
  end
end
