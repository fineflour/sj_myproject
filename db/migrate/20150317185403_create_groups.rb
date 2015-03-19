class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :team, index: true
      t.string :name
      t.string :calender
      t.string :description
      t.boolean :is_active

      t.timestamps
    end
  end
end
