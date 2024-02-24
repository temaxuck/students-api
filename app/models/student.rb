class Student < ApplicationRecord
  belongs_to :course, counter_cache: :students_count
end
