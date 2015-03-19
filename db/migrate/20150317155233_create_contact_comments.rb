class CreateContactComments < ActiveRecord::Migration
  def change
    create_table :contact_comments do |t|
      t.references :user, index: true
      t.references :order, index: true
      t.references :contact, index: true
      t.string :body

      t.timestamps
    end
  end
end
