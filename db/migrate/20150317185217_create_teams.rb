class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :city, index: true
      t.string :name
      t.string :calender
      t.boolean :is_active

      t.timestamps
    end
  end
end
