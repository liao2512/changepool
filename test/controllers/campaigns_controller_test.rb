require 'test_helper'

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @campaign = campaigns(:campaign_one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Campaign.count' do
      post campaigns_path, params: { campaign: { name: "Lorem ipsum" } }
    end
    assert_redirected_to partners_login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Campaign.count' do
      delete campaign_path(@campaign)
    end
    assert_redirected_to partners_login_url
  end
  
end
