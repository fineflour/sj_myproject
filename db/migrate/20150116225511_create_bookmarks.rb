class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :category_id
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
