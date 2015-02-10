class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address1
      t.string :address2
      t.integer :state_id
      t.string :zipcode, limit: 10

      t.timestamps
    end
    add_index :addresses, :user_id
    add_index :addresses, :state_id
  end
end
