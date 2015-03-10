class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy 

  default_scope { order('rank DESC') }
  scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }

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
    votes.sum(:value).to_i
  end

  def create_vote
    user.votes.create(value: 1, post: self)
  end

  def update_rank
    age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24)
    new_rank = points + age

    update_attribute(:rank, new_rank)
  end
end
