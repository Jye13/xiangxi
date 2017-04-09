require 'test_helper'

class WaybillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @waybill = waybills(:one)
  end

  test "should get index" do
    get waybills_url
    assert_response :success
  end

  test "should get new" do
    get new_waybill_url
    assert_response :success
  end

  test "should create waybill" do
    assert_difference('Waybill.count') do
      post waybills_url, params: { waybill: { actual_time: @waybill.actual_time, exp_time: @waybill.exp_time, next_waybill_id: @waybill.next_waybill_id, order_id: @waybill.order_id, receiver_id: @waybill.receiver_id, receiver_type: @waybill.receiver_type, sender_id: @waybill.sender_id, sender_type: @waybill.sender_type, status: @waybill.status } }
    end

    assert_redirected_to waybill_url(Waybill.last)
  end

  test "should show waybill" do
    get waybill_url(@waybill)
    assert_response :success
  end

  test "should get edit" do
    get edit_waybill_url(@waybill)
    assert_response :success
  end

  test "should update waybill" do
    patch waybill_url(@waybill), params: { waybill: { actual_time: @waybill.actual_time, exp_time: @waybill.exp_time, next_waybill_id: @waybill.next_waybill_id, order_id: @waybill.order_id, receiver_id: @waybill.receiver_id, receiver_type: @waybill.receiver_type, sender_id: @waybill.sender_id, sender_type: @waybill.sender_type, status: @waybill.status } }
    assert_redirected_to waybill_url(@waybill)
  end

  test "should destroy waybill" do
    assert_difference('Waybill.count', -1) do
      delete waybill_url(@waybill)
    end

    assert_redirected_to waybills_url
  end
end
