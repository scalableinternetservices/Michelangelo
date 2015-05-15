require 'test_helper'

class UnlikesControllerTest < ActionController::TestCase
  setup do
    @unlike = unlikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unlikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unlike" do
    assert_difference('Unlike.count') do
      post :create, unlike: { post_id: @unlike.post_id, user_id: @unlike.user_id }
    end

    assert_redirected_to unlike_path(assigns(:unlike))
  end

  test "should show unlike" do
    get :show, id: @unlike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unlike
    assert_response :success
  end

  test "should update unlike" do
    patch :update, id: @unlike, unlike: { post_id: @unlike.post_id, user_id: @unlike.user_id }
    assert_redirected_to unlike_path(assigns(:unlike))
  end

  test "should destroy unlike" do
    assert_difference('Unlike.count', -1) do
      delete :destroy, id: @unlike
    end

    assert_redirected_to unlikes_path
  end
end
