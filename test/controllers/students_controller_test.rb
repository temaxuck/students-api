require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get students_create_url
    assert_response :success
  end

  test "should get destroy" do
    get students_destroy_url
    assert_response :success
  end
end
