require "test_helper"

class NasaImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get nasa_images_welcome_url
    assert_response :success
  end
end
