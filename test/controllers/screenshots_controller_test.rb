require 'test_helper'

class ScreenshotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get screenshots_index_url
    assert_response :success
  end

end
