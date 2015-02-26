class Topic < ActiveRecord::Base
    has_many :posts
    belongs_to :user

    default_scope { order('created_at DESC') }
    validates :name, length: {minimum: 10}, presence: true
    validates :description, length: {minimum: 20}, presence: true
end
