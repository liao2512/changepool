require 'test_helper'

class DonorsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @donor = donors(:donor1)
    @other_donor = donors(:donor2)
  end
  
  test "should redirect index when not logged in" do
    get donors_path
    assert_redirected_to donors_login_url
  end
  
  test "should get new" do
    get donors_signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_donor_path(@donor)
    assert_not flash.empty?
    assert_redirected_to donors_login_url
  end

  test "should redirect update when not logged in" do
    patch donor_path(@donor), params: { donor: {  name: @donor.name,
                                                  email: @donor.email } }
    assert_not flash.empty?
    assert_redirected_to donors_login_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_donor_as(@other_donor)
    get edit_donor_path(@donor)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_donor_as(@other_donor)
    patch donor_path(@donor), params: { donor: { name: @donor.name,
                                                 email: @donor.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Donor.count' do
      delete donor_path(@donor)
    end
    assert_redirected_to donors_login_url
  end
  
  test "should destroy when logged in" do
    log_in_donor_as(@donor)
    assert_difference 'Donor.count', -1 do
      delete donor_path(@other_donor)
    end
    assert_redirected_to donors_url
  end
  
end
