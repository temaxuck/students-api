class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.references :course, null: false, foreign_key: true
      t.integer :school_id

      t.timestamps
    end
  end
end
