require 'test_helper'

class DataTransmissionsControllerTest < ActionController::TestCase
  setup do
    @data_transmission = data_transmissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_transmissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_transmission" do
    assert_difference('DataTransmission.count') do
      post :create, data_transmission: { error_code: @data_transmission.error_code, firefly_id: @data_transmission.firefly_id, high_temp: @data_transmission.high_temp, hour_meter: @data_transmission.hour_meter, low_temp: @data_transmission.low_temp, max_voltage: @data_transmission.max_voltage, min_voltage: @data_transmission.min_voltage, sent_at: @data_transmission.sent_at }
    end

    assert_redirected_to data_transmission_path(assigns(:data_transmission))
  end

  test "should show data_transmission" do
    get :show, id: @data_transmission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_transmission
    assert_response :success
  end

  test "should update data_transmission" do
    patch :update, id: @data_transmission, data_transmission: { error_code: @data_transmission.error_code, firefly_id: @data_transmission.firefly_id, high_temp: @data_transmission.high_temp, hour_meter: @data_transmission.hour_meter, low_temp: @data_transmission.low_temp, max_voltage: @data_transmission.max_voltage, min_voltage: @data_transmission.min_voltage, sent_at: @data_transmission.sent_at }
    assert_redirected_to data_transmission_path(assigns(:data_transmission))
  end

  test "should destroy data_transmission" do
    assert_difference('DataTransmission.count', -1) do
      delete :destroy, id: @data_transmission
    end

    assert_redirected_to data_transmissions_path
  end
end
