require 'test_helper'

class PartnerPanelControllerTest < ActionDispatch::IntegrationTest
  
=begin
  test "should redirect edit when logged in as wrong user" do
    log_in_partner_as(@other_partner)
    get edit_partner_path(@partner)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_partner_as(@other_partner)
    patch partner_path(@partner), params: { partner: { name: @partner.name,
                                              email: @partner.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
=end
  
  
end
