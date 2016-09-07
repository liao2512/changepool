require 'test_helper'

class AdminsLoginTest < ActionDispatch::IntegrationTest
  
  test "login with invalid information" do
    get admins_login_path
    assert_template 'admin_sessions/new'
    post admins_login_path, params: { admin_session: { email: "", password: "" } }
    assert_template 'admin_sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
end
