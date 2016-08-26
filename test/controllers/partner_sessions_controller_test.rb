require 'test_helper'

class PartnerSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get partners_login_path
    assert_response :success
  end

end
