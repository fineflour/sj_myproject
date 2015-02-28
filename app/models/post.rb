class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_many :votes

  default_scope { order('created_at DESC') }

  validates :title, length: {minimum: 5}, presence: true
  validate :body, length: {minimum: 20}, presence: true
  #validates :topic_id, presence: true
  #validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)

  end

end
