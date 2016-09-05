require 'test_helper'

class DonorTest < ActiveSupport::TestCase
  
  def setup
    @donor = Donor.new( name: "Donor Text", email: "donor1@mail.com",
                        password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @donor.valid?
  end
  
  test "email should be present" do
    @donor.email = "     "
    assert_not @donor.valid?
  end
  
  test "name should not be too long" do
    @donor.name = "a" * 51
    assert_not @donor.valid?
  end

  test "email should not be too long" do
    @donor.email = "a" * 244 + "@example.com"
    assert_not @donor.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @donor.email = valid_address
      assert @donor.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @donor.email = invalid_address
      assert_not @donor.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_donor = @donor.dup
    duplicate_donor.email = @donor.email.upcase
    @donor.save
    assert_not duplicate_donor.valid?
  end
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @donor.email = mixed_case_email
    @donor.save
    assert_equal mixed_case_email.downcase, @donor.reload.email
  end
  
  test "password should be present (nonblank)" do
    @donor.password = @donor.password_confirmation = " " * 6
    assert_not @donor.valid?
  end

  test "password should have a minimum length" do
    @donor.password = @donor.password_confirmation = "a" * 5
    assert_not @donor.valid?
  end
end
