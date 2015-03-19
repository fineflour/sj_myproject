class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :MaterialCategory, index: true
      t.string :name
      t.string :shortname
      t.string :description
      t.boolean :is_active
      t.references :language, index: true

      t.timestamps
    end
  end
end
