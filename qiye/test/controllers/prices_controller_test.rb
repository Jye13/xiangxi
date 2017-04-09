require 'test_helper'

class PricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price = prices(:one)
  end

  test "should get index" do
    get prices_url
    assert_response :success
  end

  test "should get new" do
    get new_price_url
    assert_response :success
  end

  test "should create price" do
    assert_difference('Price.count') do
      post prices_url, params: { price: { price1: @price.price1, price2: @price.price2, price3: @price.price3, price4: @price.price4, price5: @price.price5, price6: @price.price6, product_id: @price.product_id } }
    end

    assert_redirected_to price_url(Price.last)
  end

  test "should show price" do
    get price_url(@price)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_url(@price)
    assert_response :success
  end

  test "should update price" do
    patch price_url(@price), params: { price: { price1: @price.price1, price2: @price.price2, price3: @price.price3, price4: @price.price4, price5: @price.price5, price6: @price.price6, product_id: @price.product_id } }
    assert_redirected_to price_url(@price)
  end

  test "should destroy price" do
    assert_difference('Price.count', -1) do
      delete price_url(@price)
    end

    assert_redirected_to prices_url
  end
end
