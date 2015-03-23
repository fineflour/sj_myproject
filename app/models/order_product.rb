class OrderProduct < ActiveRecord::Base
  belongs_to :contact
  has_and_belongs_to_many :material
  belongs_to :order, foreign_key: 'index_order_products_on_ops_order_id'

end
