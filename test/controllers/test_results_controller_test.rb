require "test_helper"

class TestResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get test_results_index_url
    assert_response :success
  end

  test "should get new" do
    get test_results_new_url
    assert_response :success
  end
end
