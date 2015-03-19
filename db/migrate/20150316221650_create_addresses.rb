class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.references :city, index: true
      t.references :state, index: true
      t.string :zipcode
      t.references :contact, index: true
      t.binary :address_type

      t.timestamps
    end
  end
end
