require "application_system_test_case"

class CropCategoriesTest < ApplicationSystemTestCase
  setup do
    @crop_category = crop_categories(:one)
  end

  test "visiting the index" do
    visit crop_categories_url
    assert_selector "h1", text: "Crop categories"
  end

  test "should create crop category" do
    visit crop_categories_url
    click_on "New crop category"

    fill_in "Category name", with: @crop_category.category_name
    fill_in "Growing condition", with: @crop_category.growing_condition
    click_on "Create Crop category"

    assert_text "Crop category was successfully created"
    click_on "Back"
  end

  test "should update Crop category" do
    visit crop_category_url(@crop_category)
    click_on "Edit this crop category", match: :first

    fill_in "Category name", with: @crop_category.category_name
    fill_in "Growing condition", with: @crop_category.growing_condition
    click_on "Update Crop category"

    assert_text "Crop category was successfully updated"
    click_on "Back"
  end

  test "should destroy Crop category" do
    visit crop_category_url(@crop_category)
    click_on "Destroy this crop category", match: :first

    assert_text "Crop category was successfully destroyed"
  end
end
