require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  
  def setup
    @partner = partners(:partner1)
    @campaign = @partner.campaigns.build(name: "Lorem ipsum")
  end

  test "should be valid" do
    assert @campaign.valid?
  end

  test "partner id should be present" do
    @campaign.partner_id = nil
    assert_not @campaign.valid?
  end
  
  test "name should be present" do
    @campaign.name = "   "
    assert_not @campaign.valid?
  end

  test "name should be at most 140 characters" do
    @campaign.name = "a" * 141
    assert_not @campaign.valid?
  end
  
  test "order should be most recent first" do
    assert_equal campaigns(:most_recent), Campaign.first
  end
  
end
