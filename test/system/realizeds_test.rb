require "application_system_test_case"

class RealizedsTest < ApplicationSystemTestCase
  setup do
    @realized = realizeds(:one)
  end

  test "visiting the index" do
    visit realizeds_url
    assert_selector "h1", text: "Realizeds"
  end

  test "creating a Realized" do
    visit realizeds_url
    click_on "New Realized"

    fill_in "Acquired", with: @realized.acquired
    fill_in "Cost", with: @realized.cost
    check "Extra b" if @realized.extra_b
    fill_in "Extra d", with: @realized.extra_d
    fill_in "Extra de", with: @realized.extra_de
    fill_in "Extra i", with: @realized.extra_i
    fill_in "Extra s", with: @realized.extra_s
    fill_in "Proceeds", with: @realized.proceeds
    fill_in "Sold", with: @realized.sold
    fill_in "Stock", with: @realized.stock
    fill_in "Symbol", with: @realized.symbol
    click_on "Create Realized"

    assert_text "Realized was successfully created"
    click_on "Back"
  end

  test "updating a Realized" do
    visit realizeds_url
    click_on "Edit", match: :first

    fill_in "Acquired", with: @realized.acquired
    fill_in "Cost", with: @realized.cost
    check "Extra b" if @realized.extra_b
    fill_in "Extra d", with: @realized.extra_d
    fill_in "Extra de", with: @realized.extra_de
    fill_in "Extra i", with: @realized.extra_i
    fill_in "Extra s", with: @realized.extra_s
    fill_in "Proceeds", with: @realized.proceeds
    fill_in "Sold", with: @realized.sold
    fill_in "Stock", with: @realized.stock
    fill_in "Symbol", with: @realized.symbol
    click_on "Update Realized"

    assert_text "Realized was successfully updated"
    click_on "Back"
  end

  test "destroying a Realized" do
    visit realizeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Realized was successfully destroyed"
  end
end
