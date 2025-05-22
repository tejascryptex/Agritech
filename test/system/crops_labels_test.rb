require "application_system_test_case"

class CropsLabelsTest < ApplicationSystemTestCase
  setup do
    @crops_label = crops_labels(:one)
  end

  test "visiting the index" do
    visit crops_labels_url
    assert_selector "h1", text: "Crops labels"
  end

  test "should create crops label" do
    visit crops_labels_url
    click_on "New crops label"

    fill_in "Crop category", with: @crops_label.crop_category_id
    fill_in "Crop", with: @crops_label.crop_id
    click_on "Create Crops label"

    assert_text "Crops label was successfully created"
    click_on "Back"
  end

  test "should update Crops label" do
    visit crops_label_url(@crops_label)
    click_on "Edit this crops label", match: :first

    fill_in "Crop category", with: @crops_label.crop_category_id
    fill_in "Crop", with: @crops_label.crop_id
    click_on "Update Crops label"

    assert_text "Crops label was successfully updated"
    click_on "Back"
  end

  test "should destroy Crops label" do
    visit crops_label_url(@crops_label)
    click_on "Destroy this crops label", match: :first

    assert_text "Crops label was successfully destroyed"
  end
end
