class CreateBookmarkCategories < ActiveRecord::Migration
  def change
    create_table :bookmark_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
