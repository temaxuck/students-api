class ClassesController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    @courses = @school.courses
    render json: {data: @courses.as_json(only: [:id, :number, :letter, :students_count])}, status: :ok
  end

  def show
    @school = School.find(params[:school_id])
    @course = @school.courses.find(params[:class_id])
    @students = @course.students

    render json: {data: @students.map(&:students_json_builder)}, status: :ok
  end
end
