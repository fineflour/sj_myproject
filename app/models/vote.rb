class Vote < ActiveRecord::Base
  require 'post'
  belongs_to :user
  belongs_to :post
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }
  after_save :update_post

  private
    def update_post
      post.update_rank
    end

    def create_vote
      user.votes.create(value: 1, post: self)
    end
end
