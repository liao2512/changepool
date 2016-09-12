require 'test_helper'

class PartnersEditTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admins(:admin1)
    @partner = partners(:partner1)
  end

  test "unsuccessful edit" do
    log_in_admin_as(@admin)
    get edit_partner_path(@partner)
    assert_template 'partners/edit'
    patch partner_path(@partner), params: { partner: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'partners/edit'
    assert_select "div.alert"
  end
  
  test "successful edit with friendly forwarding" do
    get edit_partner_path(@partner)
    log_in_admin_as(@admin)
    assert_redirected_to edit_partner_path(@partner)
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch partner_path(@partner), params: { partner: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @partner
    @partner.reload
    assert_equal name,  @partner.name
    assert_equal email, @partner.email
  end
end
