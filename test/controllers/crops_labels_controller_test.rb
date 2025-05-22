require "test_helper"

class CropsLabelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crops_label = crops_labels(:one)
  end

  test "should get index" do
    get crops_labels_url
    assert_response :success
  end

  test "should get new" do
    get new_crops_label_url
    assert_response :success
  end

  test "should create crops_label" do
    assert_difference("CropsLabel.count") do
      post crops_labels_url, params: { crops_label: { crop_category_id: @crops_label.crop_category_id, crop_id: @crops_label.crop_id } }
    end

    assert_redirected_to crops_label_url(CropsLabel.last)
  end

  test "should show crops_label" do
    get crops_label_url(@crops_label)
    assert_response :success
  end

  test "should get edit" do
    get edit_crops_label_url(@crops_label)
    assert_response :success
  end

  test "should update crops_label" do
    patch crops_label_url(@crops_label), params: { crops_label: { crop_category_id: @crops_label.crop_category_id, crop_id: @crops_label.crop_id } }
    assert_redirected_to crops_label_url(@crops_label)
  end

  test "should destroy crops_label" do
    assert_difference("CropsLabel.count", -1) do
      delete crops_label_url(@crops_label)
    end

    assert_redirected_to crops_labels_url
  end
end
