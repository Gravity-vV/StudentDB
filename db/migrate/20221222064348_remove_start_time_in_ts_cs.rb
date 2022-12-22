class RemoveStartTimeInTsCs < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :teachers_courses, :start_time
  end

  def self.down
    add_column :teachers_courses, :start_time, :integer
  end

end
