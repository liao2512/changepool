require 'test_helper'

class AdminsSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get admins_signup_path
    assert_no_difference 'Admin.count' do
      post admins_path, params: { admin: { name:  "",
                                           email: "admin@invalid",
                                           password:              "foo",
                                           password_confirmation: "bar" } }
    end
    assert_template 'admins/new'
    #assert_select 'div#<CSS id for error explanation>'
    #assert_select 'div.<CSS class for field with error>'
  end
  
  test "valid signup information" do
    get admins_signup_path
    assert_difference 'Admin.count', 1 do
      post admins_path, params: { admin: { name:  "Example Admin",
                                           email: "admin@example.com",
                                           password:              "password",
                                           password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'admins/show'
    assert is_admin_logged_in?
  end
  
end
