require "test_helper"

class CourseTest < ActiveSupport::TestCase
  setup do
    @school = schools(:one)
  end

  test "should not save course without required fields" do
    course = @school.courses.new
    assert_not course.save, "Saved course without required fields"
  end

  test "should not save course with incorrect number" do
    course = @school.courses.new(letter: "A")
    assert_not course.save, "Saved course without specified number"

    course_number = 0
    course = @school.courses.new(number: course_number, letter: "A")
    assert_not course.save, "Saved course with incorrect course number: %d" % course_number

    course_number = 12
    course = @school.courses.new(number: course_number, letter: "A")
    assert_not course.save, "Saved course with incorrect course number: %d" % course_number
  end

  test "should not save course with incorrect letter" do
    course_letter = "not-a-letter"
    course = @school.courses.new(number: 1, letter: course_letter)
    assert_not course.save, "Saved course with letter which length is not equal to 1: %s" % course_letter
  end

end
