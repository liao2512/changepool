require 'test_helper'

class DonorsLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @donor = donors(:donor1)
  end
  
  test "donor_login with invalid information" do
    get donors_login_path
    assert_template 'donor_sessions/new'
    post donors_login_path, params: { donor_session: { email: "", password: "" } }
    assert_template 'donor_sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with valid information followed by logout" do
    get donors_login_path
    post donors_login_path, params: { donor_session: { email:    @donor.email,
                                                       password: 'lalalala' } }
    assert is_donor_logged_in?
    assert_redirected_to @donor
    follow_redirect!
    assert_template 'donors/show'
    #assert_select "a[href=?]", login_path, count: 0
    #assert_select "a[href=?]", logout_path
    #assert_select "a[href=?]", user_path(@donor)
    delete donors_logout_path
    assert_not is_donor_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    #assert_select "a[href=?]", login_path
    #assert_select "a[href=?]", logout_path,      count: 0
    #assert_select "a[href=?]", user_path(@user), count: 0
  end
  
end
