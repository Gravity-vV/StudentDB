class AddMakeUpInSsCs < ActiveRecord::Migration[6.1]
  def self.up
    add_column :students_courses, :make_up, :boolean, default: false
  end

  def self.down
    remove_column :students_courses, :make_up
  end
end
