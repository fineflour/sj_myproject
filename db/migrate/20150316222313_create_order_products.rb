class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.references :material, index: true
      t.references :status, index: true
      t.timestamps :date_fulfilled
      t.references :order, index: true

      t.timestamps
    end
  end
end
