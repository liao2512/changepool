require 'test_helper'

class AdminSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_login_path
    assert_response :success
  end

end
