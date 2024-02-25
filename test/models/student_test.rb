require "test_helper"

class StudentTest < ActiveSupport::TestCase
  setup do
    @course = courses(:one)
  end

  test "should not save course without required fields" do
    student = @course.students.new
    assert_not student.save, "Saved student without required fields"
  end

  test "should save student with empty last name" do
    student = @course.students.new(first_name: "test-first-name", surname: "test-surname")
    assert student.save, "Didn't save student without specified last name"
  end

  test "created student should have secret_salt field" do
    student = @course.students.new(first_name: "test-first-name", surname: "test-surname")
    assert student.has_attribute?(:secret_salt), "Created student instance doesn't have secret_salt attribute"
  end

end
