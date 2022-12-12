require "test_helper"

class UserProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get order_history" do
    get user_profile_order_history_url
    assert_response :success
  end
end
