class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :contact, index: true
      t.boolean :is_ops_order
      t.timestamps :ops_date_ordered
      t.timestamps :ops_date_fulfilled

      t.timestamps
    end
  end
end
