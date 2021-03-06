class CreateContactOrders < ActiveRecord::Migration
  def change
    create_table :contact_orders do |t|
      t.references :contact, index: true
      t.boolean :is_ops_order
      t.integer :ops_order_id
      t.datetime :ops_date_ordered
      t.datetime :ops_date_fulfilled
      t.datetime :ops_date_markasship

      t.timestamps
    end
  end
end
