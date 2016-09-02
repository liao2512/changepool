require 'test_helper'

class PartnersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @partner = partners(:partner1)
    @other_partner = partners(:partner2)
  end
  
  test "should redirect index when not logged in" do
    get partners_path
    assert_redirected_to partners_login_url
  end
  
  test "should get new" do
    get partners_signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_partner_path(@partner)
    assert_not flash.empty?
    assert_redirected_to partners_login_url
  end

  test "should redirect update when not logged in" do
    patch partner_path(@partner), params: { partner: {  name: @partner.name,
                                                        email: @partner.email } }
    assert_not flash.empty?
    assert_redirected_to partners_login_url
  end
  
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
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Partner.count' do
      delete partner_path(@partner)
    end
    assert_redirected_to partners_login_url
  end
  
  test "should destroy when logged in" do
    log_in_partner_as(@partner)
    assert_difference 'Partner.count', -1 do
      delete partner_path(@other_partner)
    end
    assert_redirected_to partners_url
  end

end
