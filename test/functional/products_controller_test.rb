require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    login_as_admin
    @product = products(:one)
    @update = {
      :title => 'Lorem loee3',
      :description => "fun book",
      :image_url => "image_url.jpg",
      :price => 12.4,
      subcategory_id: 1
    }
  end

  test "should get index" do
    login_as_admin
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    login_as_admin
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count', 0) do
      post :create, :product => @update
    end
  end

  test "should get edit" do
    login_as_admin
    get :edit, id: @product
    assert_response :success
  end

end
