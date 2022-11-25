class AddColumnsToTcTable < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers_courses , :start_time ,:integer
    add_column :teachers_courses , :group_id ,:integer
  end
end
