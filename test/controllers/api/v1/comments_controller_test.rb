require "test_helper"

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
   @user = users(:one)
   @post = posts(:one)
  end

  test "should create comment" do
    assert_difference("Comment.count", 1) do
      post api_v1_comments_url,
      params: { comment: { comment: "test_body", user_id: @user.id, post_id: @post.id } },
      as: :json
    end

   assert_response :created
  end

  test "should not create comment" do
    assert_no_difference("Comment.count") do
      post api_v1_comments_url,
      params: { comment: { comment: "test_body", user_id: "invalid_id", post_id: "bad_id" } },
      as: :json
    end

    assert_response :unprocessable_entity
  end
end
