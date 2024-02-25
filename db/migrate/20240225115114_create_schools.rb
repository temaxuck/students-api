class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools do |t|

      t.timestamps
    end
  end
end
