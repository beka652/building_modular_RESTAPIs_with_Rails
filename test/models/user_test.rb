require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
   @user = users(:one)
  end

  test "should create user" do
    user = User.new(name: "test_name", email: "emal@org", password: "pass124")
    assert user.valid?
  end

  test "should not create user" do
    user = User.new
    assert_not user.valid?

    user = User.new(name: "test_name", email: @user.email, password: "124")
  end
end
