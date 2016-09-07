require 'test_helper'

class AdminsLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = admins(:admin1)
  end
  
  test "login with invalid information" do
    get admins_login_path
    assert_template 'admin_sessions/new'
    post admins_login_path, params: { admin_session: { email: "", 
                                                       password: "" } }
    assert_template 'admin_sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with valid information followed by logout" do
    get admins_login_path
    post admins_login_path, params: { admin_session: {  email:    @admin.email,
                                                        password: 'lalalala' } }
    assert is_admin_logged_in?
    assert_redirected_to admins_dashboard_url
    follow_redirect!
    assert_template 'admins/dashboard'
    #assert_select "a[href=?]", login_path, count: 0
    #assert_select "a[href=?]", logout_path
    #assert_select "a[href=?]", admin_path(@admin)
    delete admins_logout_path
    assert_not is_admin_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    #assert_select "a[href=?]", login_path
    #assert_select "a[href=?]", logout_path,      count: 0
    #assert_select "a[href=?]", user_path(@user), count: 0
  end
end
