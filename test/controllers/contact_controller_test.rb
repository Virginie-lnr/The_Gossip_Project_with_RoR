require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get info" do
    get contact_info_url
    assert_response :success
  end

end
