class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_many :votes
  has_many :favorites, dependent: :destroy 

  default_scope { order('rank DESC') }

  validates :title, length: {minimum: 5}, presence: true
  validate :body, length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true
  

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def create_vote
    user.votes.create(value: 1, post: self)
  end

end
