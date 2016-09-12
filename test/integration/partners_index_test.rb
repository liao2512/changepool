require 'test_helper'

class PartnersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = admins(:admin1)
  end

  test "index including pagination" do
    log_in_admin_as(@admin)
    get partners_path
    assert_template 'partners/index'
    assert_select 'div.pagination'
    Partner.paginate(page: 1).each do |partner|
      assert_select 'a[href=?]', partner_path(partner), text: partner.name
    end
  end
  
end
