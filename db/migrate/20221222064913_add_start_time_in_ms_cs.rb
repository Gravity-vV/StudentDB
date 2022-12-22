class AddStartTimeInMsCs < ActiveRecord::Migration[6.1]
  def self.up
    add_column :majors_courses, :start_time, :integer
  end

  def self.down
    remove_column :majors_courses, :start_time
  end
end
