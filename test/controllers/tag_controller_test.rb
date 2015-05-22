require 'test_helper'

class TagControllerTest < ActionController::TestCase
  test "should get cloud" do
    get :cloud
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
