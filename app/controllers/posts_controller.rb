class PostsController < ApplicationController

  def index
    @posts = Post.all
      authorize @posts
  end

  def show
    @topic= Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    #post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
      authorize @post
  end

  def create
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.build(post_params)
      @post.user_id = current_user.id
        authorize @post

     if @post.save 
       flash[:notice] = "Post was saved."
       redirect_to topic_path(@topic.id)
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
      authorize @post
  end

   def update
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:id])
  #    authorize @post
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to topic_path(@topic.id)
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

private
  def post_params
   params.require(:post).permit(:title, :body) 
  end

end
