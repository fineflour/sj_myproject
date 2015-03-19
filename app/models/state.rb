class State < ActiveRecord::Base
  has_many :zipcodes
  has_many :cities
end
