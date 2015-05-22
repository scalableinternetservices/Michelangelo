require 'test_helper'

class UnreadcommentsControllerTest < ActionController::TestCase
  setup do
    @unreadcomment = unreadcomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unreadcomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unreadcomment" do
    assert_difference('Unreadcomment.count') do
      post :create, unreadcomment: { comment_id: @unreadcomment.comment_id, post_id: @unreadcomment.post_id, user_id: @unreadcomment.user_id }
    end

    assert_redirected_to unreadcomment_path(assigns(:unreadcomment))
  end

  test "should show unreadcomment" do
    get :show, id: @unreadcomment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unreadcomment
    assert_response :success
  end

  test "should update unreadcomment" do
    patch :update, id: @unreadcomment, unreadcomment: { comment_id: @unreadcomment.comment_id, post_id: @unreadcomment.post_id, user_id: @unreadcomment.user_id }
    assert_redirected_to unreadcomment_path(assigns(:unreadcomment))
  end

  test "should destroy unreadcomment" do
    assert_difference('Unreadcomment.count', -1) do
      delete :destroy, id: @unreadcomment
    end

    assert_redirected_to unreadcomments_path
  end
end
