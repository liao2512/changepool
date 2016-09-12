require 'test_helper'

class PartnersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @partner = partners(:partner1)
  end

  test "profile display" do
    #get partner_panel_index_path
    #assert_template 'partner_panel/index'
    #assert_select 'title', "#{@partner.name} | ChangePool Inc."
    #assert_select 'h4', text: "Name: #{@partner.name}"
    #assert_select 'h1>img.gravatar'
    #assert_match @user.microposts.count.to_s, response.body
    #assert_select 'div.pagination'
    #@user.microposts.paginate(page: 1).each do |micropost|
    #  assert_match micropost.content, response.body
    #end
  end
end
