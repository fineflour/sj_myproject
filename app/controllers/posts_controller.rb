class PostsController < ApplicationController

  def index
    @posts = Post.visible_to(current_user).where("posts.create_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10)
  end
end
