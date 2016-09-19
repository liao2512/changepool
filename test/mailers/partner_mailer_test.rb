require 'test_helper'

class PartnerMailerTest < ActionMailer::TestCase
  test "partner_account_activation" do
    partner = partners(:partner1)
    partner.activation_token = Partner.new_token
    mail = PartnerMailer.partner_account_activation(partner)
    assert_equal "Partner Account activation", mail.subject
    assert_equal [partner.email], mail.to
    assert_equal ["noreply@changepool.com"],   mail.from
    assert_match "Hi",                         mail.body.encoded
    assert_match partner.name,                 mail.body.encoded
    assert_match partner.activation_token,     mail.body.encoded
    assert_match CGI.escape(partner.email),    mail.body.encoded
  end

  test "password_reset" do
    mail = PartnerMailer.partner_password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["noreply@changepool.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
