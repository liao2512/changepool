require 'test_helper'

class AppLayoutTest < ActionDispatch::IntegrationTest
  test "nav links" do
    get root_path
    assert_template 'front_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    get about_path
    assert_select "title", "About | ChangePool Inc."
  end
end
