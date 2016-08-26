require 'test_helper'

class PartnersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @partner = partners(:partner1)
  end
  
  test "partner login with invalid information" do
    get partners_login_path
    assert_template 'partner_sessions/new'
    post partners_login_path, params: { session: { username: "", password: "" } }
    assert_template 'partner_sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "partner login with valid information and then logout" do
    get partners_login_path
    post partners_login_path, params: { session: {  username: @partner.username,
                                                    password: 'lalalala' } }
    assert is_partner_logged_in?
    assert_redirected_to @partner
    follow_redirect!
    assert_template 'partners/show'
    assert_select "a[href=?]", partners_login_path, count: 0
    assert_select "a[href=?]", partners_logout_path
    assert_select "a[href=?]", partner_path(@partner)
    delete partners_logout_path
    assert_not is_partner_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", partners_login_path
    assert_select "a[href=?]", partners_logout_path,      count: 0
    assert_select "a[href=?]", partner_path(@partner), count: 0
  end
  
end
