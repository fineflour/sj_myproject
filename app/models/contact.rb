class Contact < ActiveRecord::Base
  has_many :addresses
  has_many :contact_emails
  has_many :orders
  has_many :order_products

#  default_scope { order('created_at DESC')}

  def self.contacts_info
      self.select('contacts.*')
          .select('addresses.address1 AS address1')
          .select('addresses.address2 AS address2') 
          .select('addresses.city AS city') 
          .select('addresses.state AS state') 
          .select('addresses.zipcode AS zipcode') 
          .select('contact_emails.email AS email')
          .select('orders.id AS order_id')
          .select('orders.ops_date_ordered AS date_ordered')
          .joins(:addresses)
          .joins(:contact_emails)
          .joins(:orders)  
          .where('contact_emails.is_active =true')
          .where('addresses.is_active=true')
          .group('contacts.id')
          .group('orders.contact_id')
          .group('addresses.id')
          .group('contact_emails.id')
          .group('orders.id')
  end
  
  def self.contact_order_info
      Order.select('contacts.*')
                .select('orders.id')
                .select('orders.ops_date_ordered')
                .joins(:orders)
                .where('orders.contact_id = contacts.id')
                .group('contacts.id')
                .group('orders.id')
                .limit(10)
  end

  def fullname 
    "#{self.firstname} #{self.lastname}"
  end


  def orders
  end
end
