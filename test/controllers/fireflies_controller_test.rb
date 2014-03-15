require 'test_helper'

class FirefliesControllerTest < ActionController::TestCase
  setup do
    @firefly = fireflies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fireflies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create firefly" do
    assert_difference('Firefly.count') do
      post :create, firefly: { device_id: @firefly.device_id, hospital_id: @firefly.hospital_id, sponsor_id: @firefly.sponsor_id }
    end

    assert_redirected_to firefly_path(assigns(:firefly))
  end

  test "should show firefly" do
    get :show, id: @firefly
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @firefly
    assert_response :success
  end

  test "should update firefly" do
    patch :update, id: @firefly, firefly: { device_id: @firefly.device_id, hospital_id: @firefly.hospital_id, sponsor_id: @firefly.sponsor_id }
    assert_redirected_to firefly_path(assigns(:firefly))
  end

  test "should destroy firefly" do
    assert_difference('Firefly.count', -1) do
      delete :destroy, id: @firefly
    end

    assert_redirected_to fireflies_path
  end
end
