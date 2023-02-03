require "application_system_test_case"

class NumberStoragesTest < ApplicationSystemTestCase
  setup do
    @number_storage = number_storages(:one)
  end

  test "visiting the index" do
    visit number_storages_url
    assert_selector "h1", text: "Number Storages"
  end

  test "creating a Number storage" do
    visit number_storages_url
    click_on "New Number Storage"

    fill_in "Number storage five", with: @number_storage.number_storage_five
    fill_in "Number storage four", with: @number_storage.number_storage_four
    fill_in "Number storage one", with: @number_storage.number_storage_one
    fill_in "Number storage three", with: @number_storage.number_storage_three
    fill_in "Number storage two", with: @number_storage.number_storage_two
    click_on "Create Number storage"

    assert_text "Number storage was successfully created"
    click_on "Back"
  end

  test "updating a Number storage" do
    visit number_storages_url
    click_on "Edit", match: :first

    fill_in "Number storage five", with: @number_storage.number_storage_five
    fill_in "Number storage four", with: @number_storage.number_storage_four
    fill_in "Number storage one", with: @number_storage.number_storage_one
    fill_in "Number storage three", with: @number_storage.number_storage_three
    fill_in "Number storage two", with: @number_storage.number_storage_two
    click_on "Update Number storage"

    assert_text "Number storage was successfully updated"
    click_on "Back"
  end

  test "destroying a Number storage" do
    visit number_storages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Number storage was successfully destroyed"
  end
end
