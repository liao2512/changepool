require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | ChangePool Inc."
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | ChangePool Inc."
  end
  
end
