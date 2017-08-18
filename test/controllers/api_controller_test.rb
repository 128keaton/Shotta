require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get api_auth_url
    assert_response :success
  end

end
