class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.boolean :is_deleted
      t.string :gender
      t.string :ops_customer_id
      t.boolean :is_ops_contact
      t.boolean :followup_interest
      t.boolean :biblestudy_interest

      t.datetime :date_contacted
      t.datetime :date_imported
      t.references :language, index: true

      t.timestamps
    end
  end
  end
