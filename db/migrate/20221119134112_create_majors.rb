class CreateMajors < ActiveRecord::Migration[6.1]
  def change
    create_table :majors do |t|
      t.string :name
      t.integer :mno

      t.timestamps
    end
  end
end
