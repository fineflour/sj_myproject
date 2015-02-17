class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 #        :omniauthable, :omniauth_providers => [:facebook]
  has_many :lists
  has_many :bookmarks
  has_many :topics
  has_many :apk_keyes
  has_many :addresses
  #after_create { UserMailer.welcome_email(self).deliver }
end
