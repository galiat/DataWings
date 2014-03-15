require 'test_helper'

class DataTransmitionsControllerTest < ActionController::TestCase
  setup do
    @data_transmition = data_transmitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_transmitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_transmition" do
    assert_difference('DataTransmition.count') do
      post :create, data_transmition: { error_code: @data_transmition.error_code, firefly_id: @data_transmition.firefly_id, high_temp: @data_transmition.high_temp, hour_meter: @data_transmition.hour_meter, low_temp: @data_transmition.low_temp, max_voltage: @data_transmition.max_voltage, min_voltage: @data_transmition.min_voltage, sent_at: @data_transmition.sent_at }
    end

    assert_redirected_to data_transmition_path(assigns(:data_transmition))
  end

  test "should show data_transmition" do
    get :show, id: @data_transmition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_transmition
    assert_response :success
  end

  test "should update data_transmition" do
    patch :update, id: @data_transmition, data_transmition: { error_code: @data_transmition.error_code, firefly_id: @data_transmition.firefly_id, high_temp: @data_transmition.high_temp, hour_meter: @data_transmition.hour_meter, low_temp: @data_transmition.low_temp, max_voltage: @data_transmition.max_voltage, min_voltage: @data_transmition.min_voltage, sent_at: @data_transmition.sent_at }
    assert_redirected_to data_transmition_path(assigns(:data_transmition))
  end

  test "should destroy data_transmition" do
    assert_difference('DataTransmition.count', -1) do
      delete :destroy, id: @data_transmition
    end

    assert_redirected_to data_transmitions_path
  end
end
