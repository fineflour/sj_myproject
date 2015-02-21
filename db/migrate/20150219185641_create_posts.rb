class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.string :image
      t.float :rank
      t.string :title
      t.integer :topic_id

      t.timestamps
    end
  end
end
