class AddIndexOrderProduct < ActiveRecord::Migration
  def change
    add_index :order_products, :ops_order_id
    add_index :orders, :ops_order_id
    add_index :materiaj, :ops_order_id
  end
end
