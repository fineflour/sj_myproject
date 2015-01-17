class Bookmark < ActiveRecord::Base
  belongs_to :bookmark_categories
  belongs_to :users
  has_many :bookmark_categories
  has_many :users
end
