class StudentsController < ApplicationController
  include JwtAuthenticatable

  def create
    @course = Course.find(params[:class_id])
    @student = @course.students.create(
      first_name: params[:first_name],
      last_name: params[:last_name] ? params[:last_name] : nil,
      surname: params[:surname]
    )

    
    if @student.persisted?
      @student_auth_token = generate_jwt_for_student(@student.id, @student.secret_salt)
      response.headers['X-Auth-Token'] = @student_auth_token
      head :created
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @auth_token = get_token_from_headers(request.headers['Authorization'])

    if authenticate_student(@student, @auth_token)
      @student.destroy
      head :ok
    else
      head :unauthorized
    end
  end
end
