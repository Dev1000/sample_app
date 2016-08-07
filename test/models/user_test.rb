require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'eduardo', email: 'eduardorams@yahoo.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be presence' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'name should not be so long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should be presence' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email validation' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_addresses.inspect} should be valid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase

    @user.save
    assert_not duplicate_user.valid?
  end

end
