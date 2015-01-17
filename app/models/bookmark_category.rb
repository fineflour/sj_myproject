class BookmarkCategory < ActiveRecord::Base
  has_one :bookmarks
end
