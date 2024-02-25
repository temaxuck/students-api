class Course < ApplicationRecord
  belongs_to :school
  has_many :students

  validates :number, presence: true, inclusion: 1..11
  validates :letter, presence: true, length: { maximum: 1 }

end
