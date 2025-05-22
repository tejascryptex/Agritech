require "test_helper"

class CropCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crop_category = crop_categories(:one)
  end

  test "should get index" do
    get crop_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_crop_category_url
    assert_response :success
  end

  test "should create crop_category" do
    assert_difference("CropCategory.count") do
      post crop_categories_url, params: { crop_category: { category_name: @crop_category.category_name, growing_condition: @crop_category.growing_condition } }
    end

    assert_redirected_to crop_category_url(CropCategory.last)
  end

  test "should show crop_category" do
    get crop_category_url(@crop_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_crop_category_url(@crop_category)
    assert_response :success
  end

  test "should update crop_category" do
    patch crop_category_url(@crop_category), params: { crop_category: { category_name: @crop_category.category_name, growing_condition: @crop_category.growing_condition } }
    assert_redirected_to crop_category_url(@crop_category)
  end

  test "should destroy crop_category" do
    assert_difference("CropCategory.count", -1) do
      delete crop_category_url(@crop_category)
    end

    assert_redirected_to crop_categories_url
  end
end
