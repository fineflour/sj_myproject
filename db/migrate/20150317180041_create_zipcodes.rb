class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.references :city, index: true
      t.integer :type
      t.string :zipcode_id
      t.string :zipcode

      t.timestamps
    end
  end
end
