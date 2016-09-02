require 'test_helper'

class PartnerSessionsHelperTest < ActionView::TestCase
  
  def setup
    @partner = partners(:partner1)
    remember_partner(@partner)
  end

  test "current_partner returns right partner when session is nil" do
    assert_equal @partner, current_partner
    assert is_partner_logged_in?
  end

  test "current_partner returns nil when remember digest is wrong" do
    @partner.update_attribute(:remember_digest, Partner.digest(Partner.new_token))
    assert_nil current_partner
  end
end