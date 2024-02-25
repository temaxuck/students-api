require "test_helper"
require_relative "concerns/get_response_values.rb"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  include JwtAuthenticatable
  include GetResponseValues

  setup do
    @school = schools(:one)
    @course = courses(:one)
    @student = students(:one)
    @another_student = students(:two)

    @new_student_params = {
      first_name: "test-first-name",
      last_name: "test-last-name",
      surname: "test-surname",
      class_id: @course.id,
      school_id: @school.id
    }
  end

  test "should post create" do
    post students_create_url, params: @new_student_params
    assert_response :success
  end

  test "post create should respond with authenticatable X-Auth-Token header" do
    post students_create_url, params: @new_student_params
    assert_not response_x_auth_header.nil?, "X-Auth-Token header hasn't been set"
    
    new_student = Student.last
    payload = decode_jwt(response_x_auth_header)
    assert payload["student_id"] == new_student.id && payload["secret_salt"] == new_student.secret_salt, "Generated authentication token is not correct" 
  end

  test "should delete destroy" do
    delete students_destroy_url(@student), headers: {
      Authorization: generate_jwt_for_student(@student.id, @student.secret_salt)
    }

    assert_response :success
  end

  
  test "should not destroy student with wrong authentication token" do
    delete students_destroy_url(@another_student), headers: {
      Authorization: generate_jwt_for_student(@student.id, @student.secret_salt)
    }

    assert_response :unauthorized
  end

  test "should not destroy non-existent student" do
    delete students_destroy_url(Student.last.id + rand(1..10)), headers: {
      Authorization: generate_jwt_for_student(@student.id, @student.secret_salt)
    }

    assert_response :not_found

    delete students_destroy_url(@student.id), headers: {
      Authorization: generate_jwt_for_student(Student.last.id + rand(1..10), @student.secret_salt)
    }

    assert_response :unauthorized
  end
end
