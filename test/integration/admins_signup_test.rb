require 'test_helper'

class AdminsSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get admins_signup_path
    assert_no_difference 'Admin.count' do
      post admins_path, params: { user: { name:  "",
                                         email: "admin@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'admins/new'
  end
  
end
