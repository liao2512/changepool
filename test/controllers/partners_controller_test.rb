require 'test_helper'

class PartnersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get partners_signup_path
    assert_response :success
  end

end
