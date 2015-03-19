class CreateContactEmails < ActiveRecord::Migration
  def change
    create_table :cemails do |t|
      t.references :contact, index: true
      t.string :email
      t.boolean :is_active

      t.timestamps
    end
  end
end
