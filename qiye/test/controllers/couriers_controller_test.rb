require 'test_helper'

class CouriersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courier = couriers(:one)
  end

  test "should get index" do
    get couriers_url
    assert_response :success
  end

  test "should get new" do
    get new_courier_url
    assert_response :success
  end

  test "should create courier" do
    assert_difference('Courier.count') do
      post couriers_url, params: { courier: {  } }
    end

    assert_redirected_to courier_url(Courier.last)
  end

  test "should show courier" do
    get courier_url(@courier)
    assert_response :success
  end

  test "should get edit" do
    get edit_courier_url(@courier)
    assert_response :success
  end

  test "should update courier" do
    patch courier_url(@courier), params: { courier: {  } }
    assert_redirected_to courier_url(@courier)
  end

  test "should destroy courier" do
    assert_difference('Courier.count', -1) do
      delete courier_url(@courier)
    end

    assert_redirected_to couriers_url
  end
end
