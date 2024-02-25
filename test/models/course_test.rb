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

  test "created course should have correct students_count field" do
    course = @school.courses.create(number: 1, letter: "A")
    
    assert course.students_count == 0, "Course instance has incorrect students count: %d, but should have %d" % [course.students_count, 0]

    student = course.students.create(first_name: "test-first-name", surname: "test-surname")
    assert course.students_count == 1, "Course instance has incorrect students count: %d, but should have %d" % [course.students_count, 1]

    another_course = @school.courses.create(number: 1, letter: "B")
    student.course = another_course
    student.save
    course.reload
    assert course.students_count == 0, "Course instance has incorrect students count: %d, but should have %d" % [course.students_count, 0]

    student.course = course
    student.save
    course.reload
    student.destroy
    assert course.students_count == 0, "Course instance has incorrect students count: %d, but should have %d" % [course.students_count, 0]
  end

end
