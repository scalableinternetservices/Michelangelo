require 'test_helper'

class UnreadlikesControllerTest < ActionController::TestCase
  setup do
    @unreadlike = unreadlikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unreadlikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unreadlike" do
    assert_difference('Unreadlike.count') do
      post :create, unreadlike: { liker: @unreadlike.liker, liketype: @unreadlike.liketype, post_id: @unreadlike.post_id, user_id: @unreadlike.user_id }
    end

    assert_redirected_to unreadlike_path(assigns(:unreadlike))
  end

  test "should show unreadlike" do
    get :show, id: @unreadlike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unreadlike
    assert_response :success
  end

  test "should update unreadlike" do
    patch :update, id: @unreadlike, unreadlike: { liker: @unreadlike.liker, liketype: @unreadlike.liketype, post_id: @unreadlike.post_id, user_id: @unreadlike.user_id }
    assert_redirected_to unreadlike_path(assigns(:unreadlike))
  end

  test "should destroy unreadlike" do
    assert_difference('Unreadlike.count', -1) do
      delete :destroy, id: @unreadlike
    end

    assert_redirected_to unreadlikes_path
  end
end
