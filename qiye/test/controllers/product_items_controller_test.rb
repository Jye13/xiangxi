require 'test_helper'

class ProductItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_item = product_items(:one)
  end

  test "should get index" do
    get product_items_url
    assert_response :success
  end

  test "should get new" do
    get new_product_item_url
    assert_response :success
  end

  test "should create product_item" do
    assert_difference('ProductItem.count') do
      post product_items_url, params: { product_item: { order_id: @product_item.order_id, product_id: @product_item.product_id, serial: @product_item.serial, status: @product_item.status } }
    end

    assert_redirected_to product_item_url(ProductItem.last)
  end

  test "should show product_item" do
    get product_item_url(@product_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_item_url(@product_item)
    assert_response :success
  end

  test "should update product_item" do
    patch product_item_url(@product_item), params: { product_item: { order_id: @product_item.order_id, product_id: @product_item.product_id, serial: @product_item.serial, status: @product_item.status } }
    assert_redirected_to product_item_url(@product_item)
  end

  test "should destroy product_item" do
    assert_difference('ProductItem.count', -1) do
      delete product_item_url(@product_item)
    end

    assert_redirected_to product_items_url
  end
end
