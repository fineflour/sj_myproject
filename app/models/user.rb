class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 #        :omniauthable, :omniauth_providers => [:facebook]
  has_many :topics
  has_many :posts
  has_many :comments, :through => :posts
  has_many :votes
  has_many :favorites, dependent: :destroy 

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end
  #after_create { UserMailer.welcome_email(self).deliver }

  def favorited(post)
   favorites.where(post_id: post.id).first
  end
end
