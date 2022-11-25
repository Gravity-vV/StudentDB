class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :gno
      t.integer :major_id
      t.timestamps
    end
  end
end
