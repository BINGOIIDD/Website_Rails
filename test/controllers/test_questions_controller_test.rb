require "test_helper"

class TestQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get test_questions_new_url
    assert_response :success
  end
end
