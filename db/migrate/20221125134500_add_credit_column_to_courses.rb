class AddCreditColumnToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses , :credit ,:float
  end
end
