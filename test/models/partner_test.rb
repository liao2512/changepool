require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  
  def setup
    @partner = Partner.new(name: "Partner 1", username: "partner1234", email: "p1@mail.com", 
                           password: "lalalala", password_confirmation: "lalalala")
  end

  test "should be valid" do
    assert @partner.valid?
  end
  
  test "name should be present" do
    @partner.name = "     "
    assert !@partner.valid?
  end
  
  test "username should be present" do
    @partner.username = "     "
    assert_not @partner.valid?
  end
  
  test "email should be present" do
    @partner.email = "     "
    assert_not @partner.valid?
  end
  
  test "username should not be too long" do
    @partner.username = "a" * 51
    assert_not @partner.valid?
  end
  
  test "username should not be too short" do
    @partner.username = "a" * 3
    assert_not @partner.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @partner.email = valid_address
      assert @partner.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "username should be unique" do
    duplicate_partner = @partner.dup
    duplicate_partner.email = @partner.email.upcase
    @partner.save
    assert_not duplicate_partner.valid?
  end
  
  test "password should be present" do
    @partner.password = @partner.password_confirmation = " " * 6
    assert_not @partner.valid?
  end

  test "password should have a minimum length" do
    @partner.password = @partner.password_confirmation = "a" * 5
    assert_not @partner.valid?
  end
  
  test "authenticated? should return false for a partner with nil digest" do
    assert_not @partner.authenticated?(:remember, '')
  end
  
  test "associated campaigns should be destroyed" do
    @partner.save
    @partner.campaigns.create!(name: "Lorem ipsum")
    assert_difference 'Campaign.count', -1 do
      @partner.destroy
    end
  end
  
end
