class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.integer :number
      t.string :letter
      t.integer :students_count, default: 0

      t.timestamps
    end
  end
end
