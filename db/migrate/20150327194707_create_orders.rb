class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.contacts :references
      t.boolean :is_ops_order
      t.datetime :ops_date_ordered
      t.datetime :ops_date_fulfilled
      t.datetime :ops_date_markasshiped

      t.timestamps
    end
  end
end
