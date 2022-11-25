class RemoveColumnsToCourseTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses ,:cno
    remove_column :courses ,:start_time

  end
end
