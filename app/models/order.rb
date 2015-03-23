class Order < ActiveRecord::Base
  belongs_to :contact
  has_many :order_products, foreign_key: 'index_order_products_on_ops_order_id'

  def self.orders_detail(contact_id)
      self.select('orders.') 
      joins(:order_products)
      .where('orders.ops_order_id = order_products.ops_order_id')
      .where('orders.contact_id =' + contact_id)
      .group('orders.ops_order_id')
    end
end
