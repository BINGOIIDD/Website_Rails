require "test_helper"

class TestListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get test_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get test_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get test_lists_new_url
    assert_response :success
  end

  test "should get edit" do
    get test_lists_edit_url
    assert_response :success
  end
end
