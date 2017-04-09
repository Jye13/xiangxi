require 'test_helper'

class PriceRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_rule = price_rules(:one)
  end

  test "should get index" do
    get price_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_price_rule_url
    assert_response :success
  end

  test "should create price_rule" do
    assert_difference('PriceRule.count') do
      post price_rules_url, params: { price_rule: { category_id: @price_rule.category_id, city_id: @price_rule.city_id, from_date: @price_rule.from_date, grade: @price_rule.grade } }
    end

    assert_redirected_to price_rule_url(PriceRule.last)
  end

  test "should show price_rule" do
    get price_rule_url(@price_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_rule_url(@price_rule)
    assert_response :success
  end

  test "should update price_rule" do
    patch price_rule_url(@price_rule), params: { price_rule: { category_id: @price_rule.category_id, city_id: @price_rule.city_id, from_date: @price_rule.from_date, grade: @price_rule.grade } }
    assert_redirected_to price_rule_url(@price_rule)
  end

  test "should destroy price_rule" do
    assert_difference('PriceRule.count', -1) do
      delete price_rule_url(@price_rule)
    end

    assert_redirected_to price_rules_url
  end
end
