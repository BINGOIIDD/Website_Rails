require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index_product" do
    get users_index_product_url
    assert_response :success
  end

  test "should get index_review" do
    get users_index_review_url
    assert_response :success
  end
end
