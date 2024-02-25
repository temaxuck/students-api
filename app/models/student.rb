class Student < ApplicationRecord
  belongs_to :course, counter_cache: :students_count

  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :school_id, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  
end
