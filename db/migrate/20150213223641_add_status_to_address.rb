class AddStatusToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :status_id, :integer, default: 0
  end
end
