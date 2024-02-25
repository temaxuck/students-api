class ClassesController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    @courses = @school.courses
    render json: {data: @courses.as_json(only: [:id, :number, :letter, :students_count])}, status: :ok
  end

  def show
  end
end
