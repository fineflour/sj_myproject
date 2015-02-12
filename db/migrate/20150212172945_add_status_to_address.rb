class AddStatusToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :status, :string
    add_index :addresses, :status
  end
end
