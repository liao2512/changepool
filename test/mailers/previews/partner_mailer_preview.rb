# Preview all emails at http://localhost:3000/rails/mailers/partner_mailer
class PartnerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/partner_mailer/partner_activation
  def partner_account_activation
    partner = Partner.first
    partner.activation_token = Partner.new_token
    PartnerMailer.partner_account_activation(partner)
  end

  # Preview this email at http://localhost:3000/rails/mailers/partner_mailer/password_reset
  def partner_password_reset
    PartnerMailer.partner_password_reset
  end

end
