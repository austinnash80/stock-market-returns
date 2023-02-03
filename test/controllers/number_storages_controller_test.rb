require "test_helper"

class NumberStoragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @number_storage = number_storages(:one)
  end

  test "should get index" do
    get number_storages_url
    assert_response :success
  end

  test "should get new" do
    get new_number_storage_url
    assert_response :success
  end

  test "should create number_storage" do
    assert_difference('NumberStorage.count') do
      post number_storages_url, params: { number_storage: { number_storage_five: @number_storage.number_storage_five, number_storage_four: @number_storage.number_storage_four, number_storage_one: @number_storage.number_storage_one, number_storage_three: @number_storage.number_storage_three, number_storage_two: @number_storage.number_storage_two } }
    end

    assert_redirected_to number_storage_url(NumberStorage.last)
  end

  test "should show number_storage" do
    get number_storage_url(@number_storage)
    assert_response :success
  end

  test "should get edit" do
    get edit_number_storage_url(@number_storage)
    assert_response :success
  end

  test "should update number_storage" do
    patch number_storage_url(@number_storage), params: { number_storage: { number_storage_five: @number_storage.number_storage_five, number_storage_four: @number_storage.number_storage_four, number_storage_one: @number_storage.number_storage_one, number_storage_three: @number_storage.number_storage_three, number_storage_two: @number_storage.number_storage_two } }
    assert_redirected_to number_storage_url(@number_storage)
  end

  test "should destroy number_storage" do
    assert_difference('NumberStorage.count', -1) do
      delete number_storage_url(@number_storage)
    end

    assert_redirected_to number_storages_url
  end
end
