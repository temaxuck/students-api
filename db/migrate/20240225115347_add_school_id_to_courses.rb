class AddSchoolIdToCourses < ActiveRecord::Migration[7.1]
  def change
    add_reference :courses, :school, null: false, foreign_key: true
  end
end
