require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome_visitor" do
    get home_welcome_visitor_url
    assert_response :success
  end

end
