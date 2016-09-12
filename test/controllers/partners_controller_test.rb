require 'test_helper'

class PartnersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = admins(:admin1)
    @partner = partners(:partner1)
    @other_partner = partners(:partner2)
  end
  
  test "should redirect index when not logged in" do
    get partners_path
    assert_redirected_to admins_login_url
  end
  
  test "should get new" do
    get partners_signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_partner_path(@partner)
    assert_not flash.empty?
    assert_redirected_to admins_login_url
  end

  test "should redirect update when not logged in" do
    patch partner_path(@partner), params: { partner: {  name: @partner.name,
                                                        email: @partner.email } }
    assert_not flash.empty?
    assert_redirected_to admins_login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Partner.count' do
      delete partner_path(@partner)
    end
    assert_redirected_to admins_login_url
  end
  
  test "should destroy when logged in" do
    log_in_admin_as(@admin)
    assert_difference 'Partner.count', -1 do
      delete partner_path(@other_partner)
    end
    assert_redirected_to partners_url
  end

end
