require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get full_import" do
    get :full_import
    assert_response :success
  end

end
