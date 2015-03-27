class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :order, index: true
      t.references :contact, index: true
      t.boolean :is_ops_order
      t.references :material, index: true
      t.integer :status
      t.datetime :ops_date_markasshiped

      t.timestamps
    end
  end
end
