module JwtAuthenticatable
  extend ActiveSupport::Concern

  def generate_jwt_for_student(student_id, secret_salt)
    payload = {
      student_id: student_id,
      secret_salt: secret_salt
    }

    token = JWT.encode payload, Rails.application.config.secret_key_base, "HS256"

    return token
  end

  def decode_jwt(auth_token)
    decoded_token = JWT.decode auth_token, Rails.application.config.secret_key_base, true, { algorithm: 'HS256' }
    return decoded_token[0]
  rescue JWT::DecodeError
    return nil
  end

  def get_token_from_headers(auth_header)
    return auth_header.split(" ").last if auth_header  
  end

  def authenticate_student(expected_student, auth_token)
    decoded_payload = decode_jwt(auth_token) if auth_token

    if not decoded_payload
      return false
    else
      begin
        @actual_student = Student.find(decoded_payload["student_id"].to_i)
        return same_students?(@actual_student, expected_student, decoded_payload)
      rescue ActiveRecord::RecordNotFound
        return false
      end
    end
  end

  private
    def same_students?(actual_student, expected_student, payload)
      if @actual_student == expected_student and @actual_student.secret_salt == payload["secret_salt"]
        return true
      end

      return false
    end
end