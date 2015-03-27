class OrderProduct < ActiveRecord::Base
  belongs_to :contact
  has_and_belongs_to_many :material
  belongs_to :order 

    scope :order_detail, -> { 
      joins("Order").where("Order.id = ?", :order_id)
    }
  end
