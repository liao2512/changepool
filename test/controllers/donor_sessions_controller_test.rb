require 'test_helper'

class DonorSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get donors_login_path
    assert_response :success
  end

end
