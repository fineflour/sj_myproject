class City < ActiveRecord::Base
  has_many :zipcodes
  belongs_to :state
end
