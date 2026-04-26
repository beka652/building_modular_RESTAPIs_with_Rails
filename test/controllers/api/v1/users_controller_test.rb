require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
   @user = users(:one)
  end
  test "should create user" do
    assert_difference("User.count", 1) do
      post api_v1_users_url,
      params: { user: { name: "Nobody", email: "me@google.com", password: "1234" } },
      as: :json
    end
    assert_response :created
  end

  test "should not create user with duplicate email" do
    assert_no_difference("User.count") do
      post api_v1_users_url,
      params: { user: { name: "test_name", email: @user.email, password: "234" } },
      as: :json
    end
    assert_response :unprocessable_entity
  end
end
