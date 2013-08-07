require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do
    login_as_admin
    get :index
    assert_response :success
  end
end
