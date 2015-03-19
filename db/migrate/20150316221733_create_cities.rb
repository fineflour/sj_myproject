class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :state, index: true
      t.string :name
      t.string :description
      t.boolean :is_active

      t.timestamps
    end
  end
end
