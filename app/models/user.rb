class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 #        :omniauthable, :omniauth_providers => [:facebook]
  has_many :posts

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end
  #after_create { UserMailer.welcome_email(self).deliver }
end
