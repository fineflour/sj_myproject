class Contact < ActiveRecord::Base
  has_many :addresses
  has_many :contact_emails
  has_many :orders

  default_scope { order('created_at DESC')}

  def self.contacts_detail
      self.select('contacts.*')
          .select('addresses.address1 AS address1')
          .select('addresses.address2 AS address2') 
          .select('addresses.city AS city') 
          .select('addresses.state AS state') 
          .select('addresses.zipcode AS zipcode') 
          .select('contact_emails.email AS email')
          .joins(:addresses)
          .joins(:contact_emails)
          .where('contact_emails.is_active =true')
          .where('addresses.is_active=true')
          .group('contacts.id')
          .group('addresses.id')
          .group('contact_emails.id')
  end
end
