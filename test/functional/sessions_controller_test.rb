require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get destroy" do
    login_as_admin
    get :destroy
    assert_redirected_to store_url
  end

  test "should login" do
    dave = users(:admin)
    post :create, name: dave.name, password: '12345678'
    assert_redirected_to store_url
    assert_equal dave.id, session[:user_id]
  end

  test "should fail login" do
    dave = users(:admin)
    post :create, name: dave.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
  end

end
