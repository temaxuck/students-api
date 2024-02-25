class Student < ApplicationRecord
  before_create :generate_secret_salt

  belongs_to :course, counter_cache: :students_count

  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :school_id, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  
  public
    def generate_secret_salt
      self.secret_salt = SecureRandom.hex(16)
    end

end
