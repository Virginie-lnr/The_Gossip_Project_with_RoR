require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get get_username" do
    get welcome_get_username_url
    assert_response :success
  end

end
