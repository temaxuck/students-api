require "test_helper"

class ClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get classes_index_url
    assert_response :success
  end

  test "should get show" do
    get classes_show_url
    assert_response :success
  end
end
