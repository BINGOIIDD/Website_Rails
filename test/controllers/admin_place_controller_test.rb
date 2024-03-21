require "test_helper"

class AdminPlaceControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get admin_place_main_url
    assert_response :success
  end

  test "should get users" do
    get admin_place_users_url
    assert_response :success
  end
end
