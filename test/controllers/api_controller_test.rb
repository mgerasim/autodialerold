require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get settings" do
    get api_settings_url
    assert_response :success
  end

  test "should get count" do
    get api_count_url
    assert_response :success
  end

end
