require "test_helper"

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
   @user = users(:one)
   @post = posts(:one)
   @one_comment = comments(:one)
   @second_comment = comments(:two)
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

  # PATCH /comments/:id
  test "should update comment" do
    patch api_v1_comment_url(@one_comment),
    params: { comment: { comment: "new content", user_id: @second_comment.user_id, post_id: @second_comment.post_id } },
    as: :json

    assert_response :success
  end

  test "should not update comment" do
    patch api_v1_comment_url(@one_comment),
    params: { comment: { comment: "new comment", user_id: "bad_id", post_id: "bad_id" } },
    as: :json
    assert_response :unprocessable_entity
  end
end
