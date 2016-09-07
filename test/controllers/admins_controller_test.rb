require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = admins(:admin1)
    @other_admin = admins(:admin2)
  end
  
  test "should redirect index when not logged in" do
    get admins_path
    assert_redirected_to admins_login_url
  end
  
  test "should get new" do
    get admins_signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_admin_path(@admin)
    assert_not flash.empty?
    assert_redirected_to admins_login_url
  end

  test "should redirect update when not logged in" do
    patch admin_path(@admin), params: { admin: {  name: @admin.name,
                                                  email: @admin.email } }
    assert_not flash.empty?
    assert_redirected_to admins_login_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_admin_as(@other_admin)
    get edit_admin_path(@admin)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_admin_as(@other_admin)
    patch admin_path(@admin), params: { admin: { name: @admin.name,
                                                 email: @admin.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Admin.count' do
      delete admin_path(@admin)
    end
    assert_redirected_to admins_login_url
  end
  
  test "should destroy when logged in" do
    log_in_admin_as(@admin)
    assert_difference 'Admin.count', -1 do
      delete admin_path(@other_admin)
    end
    assert_redirected_to admins_url
  end
  
end
