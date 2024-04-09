require "test_helper"

class CatDigitalControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cat_digital_create_url
    assert_response :success
  end

  test "should get update" do
    get cat_digital_update_url
    assert_response :success
  end
end
