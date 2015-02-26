class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :post, presence: true
  validates :body, presence: true
  default_scope { order('created_at DESC') }
end
