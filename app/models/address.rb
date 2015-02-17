class Address < ActiveRecord::Base
  belongs_to :user
  has_many :states
  default_scope { order('updated_at DESC') }
  validates :address1, presence: true
  validates :city, presence: true
  validate :zipcode, presence: true, length: { is: 5}

end
