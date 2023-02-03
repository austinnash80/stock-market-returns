require "test_helper"

class RealizedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @realized = realizeds(:one)
  end

  test "should get index" do
    get realizeds_url
    assert_response :success
  end

  test "should get new" do
    get new_realized_url
    assert_response :success
  end

  test "should create realized" do
    assert_difference('Realized.count') do
      post realizeds_url, params: { realized: { acquired: @realized.acquired, cost: @realized.cost, extra_b: @realized.extra_b, extra_d: @realized.extra_d, extra_de: @realized.extra_de, extra_i: @realized.extra_i, extra_s: @realized.extra_s, proceeds: @realized.proceeds, sold: @realized.sold, stock: @realized.stock, symbol: @realized.symbol } }
    end

    assert_redirected_to realized_url(Realized.last)
  end

  test "should show realized" do
    get realized_url(@realized)
    assert_response :success
  end

  test "should get edit" do
    get edit_realized_url(@realized)
    assert_response :success
  end

  test "should update realized" do
    patch realized_url(@realized), params: { realized: { acquired: @realized.acquired, cost: @realized.cost, extra_b: @realized.extra_b, extra_d: @realized.extra_d, extra_de: @realized.extra_de, extra_i: @realized.extra_i, extra_s: @realized.extra_s, proceeds: @realized.proceeds, sold: @realized.sold, stock: @realized.stock, symbol: @realized.symbol } }
    assert_redirected_to realized_url(@realized)
  end

  test "should destroy realized" do
    assert_difference('Realized.count', -1) do
      delete realized_url(@realized)
    end

    assert_redirected_to realizeds_url
  end
end
