require 'test_helper'

class PartnersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid partner signup information" do
    get partners_signup_path
    assert_no_difference 'Partner.count' do
      post partners_path, params: { partner: {  name:  "",
                                                username:  "12",
                                                email: "user@invalid",
                                                password:              "123",
                                                password_confirmation: "456" } }
    end
    assert_template 'partners/new'
  end
  
  test "valid partner signup information" do
    get partners_signup_path
    assert_difference 'Partner.count', 1 do
      post partners_path, params: { partner: {  name:  "Partner",
                                                username:  "1234",
                                                email: "partner@example.com",
                                                password:              "password",
                                                password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'partners/show'
    assert_not flash.empty?
  end
  
end