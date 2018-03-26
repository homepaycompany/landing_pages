require 'test_helper'

class PropertyImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get property_images_create_url
    assert_response :success
  end
end
