class Student < ApplicationRecord
  before_create :generate_secret_salt

  belongs_to :course, counter_cache: :students_count

  validates :first_name, presence: true, length: { minimum: 1 }
  validates :surname, presence: true, length: { minimum: 1 }
  
  public
    def generate_secret_salt
      self.secret_salt = SecureRandom.hex(16)
    end

    def students_json_builder
      {
        id: id,
        first_name: first_name,
        last_name: last_name,
        surname: surname,
        class_id: course_id,
        school_id: course.school.id
      }
    end
end
