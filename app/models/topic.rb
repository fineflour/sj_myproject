class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    #belongs_to :user
    scope :publicly_viewable, -> { where(public: true)}
    scope :privately_viewable, -> { where(public: false)}

#    default_scope { order('created_at DESC') }
    validates :name, length: {minimum: 10}, presence: true
    validates :description, length: {minimum: 20}, presence: true
    scope :visible_to, -> (user) { user ? all : where(public: true)}
end
