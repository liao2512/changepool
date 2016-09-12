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
    assert_redirected_to partner_panel_index_path
    follow_redirect!
    assert_template 'partner_panel/index'
    #assert_select "a[href=?]", partners_login_path, count: 0
    #assert_select "a[href=?]", partners_logout_path
    #assert_select "a[href=?]", partner_path(@partner)
    delete partners_logout_path
    assert_not is_partner_logged_in?
    assert_redirected_to root_url
    # Simulate a partner clicking logout in a second window.
    delete partners_logout_path
    follow_redirect!
    assert_select "a[href=?]", partners_login_path
    assert_select "a[href=?]", partners_logout_path,      count: 0
    assert_select "a[href=?]", partner_path(@partner), count: 0
  end
  
  test "partner login with remembering" do
    log_in_partner_as(@partner, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "partner login without remembering" do
    log_in_partner_as(@partner, remember_me: '0')
    assert_nil cookies['remember_token']
  end
  
end
