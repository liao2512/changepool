require 'test_helper'

class DonorsSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get donors_signup_path
    assert_no_difference 'Donor.count' do
      post donors_path, params: { donor: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'donors/new'
    #assert_select 'div#<CSS id for error explanation>'
    #assert_select 'div.<CSS class for field with error>'
  end
  
  test "valid signup information" do
    get donors_signup_path
    assert_difference 'Donor.count', 1 do
      post donors_path, params: { donor: { name:  "Example Donor",
                                         email: "donor9834@mail.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'donors/show'
    assert is_donor_logged_in?
  end
  
end
