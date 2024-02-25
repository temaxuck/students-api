require "test_helper"
require_relative "concerns/get_response_values.rb"

class ClassesControllerTest < ActionDispatch::IntegrationTest
  include GetResponseValues

  setup do
    @school = schools(:one)
    @course = courses(:one)
  end
  
  test "should get index" do
    get classes_index_url(@school)
    assert_response :success
  end

  test "get index should respond with proper json" do
    expected_json = {
      data: [
        {id: 1, number: 1, letter: "А", students_count: 1},
        {id: 2, number: 1, letter: "Б", students_count: 1}
      ]
    }
    get classes_index_url(@school)
    assert expected_json == json_response, "Actual json response is incorrect"
  end

  test "should get show" do
    get classes_show_url(@school, @course)
    assert_response :success
  end
  
  test "get show should respond with proper json" do
    expected_json = {
      data: [
        {
          id: 1,
          first_name: "test-first-name", 
          last_name: "test-last-name",
          surname: "test-surname",
          class_id: 1,
          school_id: 1
        }
      ]
    }
    
    get classes_show_url(@school, @course)
    assert expected_json == json_response, "Actual json response is incorrect"
  end

end
