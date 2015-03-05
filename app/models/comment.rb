class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :post, presence: true
  validates :body, presence: true
  default_scope { order('created_at DESC') }

after_create :send_favorite_emails

private

  def send_favorite_emails
    post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, post, self).deliever
    end

  end
end
