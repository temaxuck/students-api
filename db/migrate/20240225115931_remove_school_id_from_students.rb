class RemoveSchoolIdFromStudents < ActiveRecord::Migration[7.1]
  def change
    remove_column :students, :school_id, :integer
  end
end
