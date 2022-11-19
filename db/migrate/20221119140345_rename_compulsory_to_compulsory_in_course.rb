class RenameCompulsoryToCompulsoryInCourse < ActiveRecord::Migration[6.1]
  def up
    rename_column :courses ,:compusory,:compulsory
  end

  def down
    rename_column :courses ,:compulsory,:compusory
  end

end
