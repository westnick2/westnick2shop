require "application_system_test_case"

class StuffsTest < ApplicationSystemTestCase
  setup do
    @stuff = stuffs(:one)
  end

  test "visiting the index" do
    visit stuffs_url
    assert_selector "h1", text: "Stuffs"
  end

  test "creating a Stuff" do
    visit stuffs_url
    click_on "New Stuff"

    fill_in "Full description", with: @stuff.full_description
    fill_in "In stock", with: @stuff.in_stock
    fill_in "Preview image", with: @stuff.preview_image
    fill_in "Price", with: @stuff.price
    fill_in "Short description", with: @stuff.short_description
    fill_in "Slug", with: @stuff.slug
    fill_in "Title", with: @stuff.title
    click_on "Create Stuff"

    assert_text "Stuff was successfully created"
    click_on "Back"
  end

  test "updating a Stuff" do
    visit stuffs_url
    click_on "Edit", match: :first

    fill_in "Full description", with: @stuff.full_description
    fill_in "In stock", with: @stuff.in_stock
    fill_in "Preview image", with: @stuff.preview_image
    fill_in "Price", with: @stuff.price
    fill_in "Short description", with: @stuff.short_description
    fill_in "Slug", with: @stuff.slug
    fill_in "Title", with: @stuff.title
    click_on "Update Stuff"

    assert_text "Stuff was successfully updated"
    click_on "Back"
  end

  test "destroying a Stuff" do
    visit stuffs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stuff was successfully destroyed"
  end
end
