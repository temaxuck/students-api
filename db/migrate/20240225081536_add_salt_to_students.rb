class AddSaltToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :secret_salt, :string
    change_column_null :students, :secret_salt, false
  end
end
