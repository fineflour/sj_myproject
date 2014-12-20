class AddCompleteToItems < ActiveRecord::Migration
  def change
    add_column :items, :status_id, :integer, default: 0, null: false
  end
end
