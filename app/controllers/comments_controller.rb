class CommentsController < ApplicationController
  def index
    
  end

  def show
    @topic = Topic.find(params[:id])
    @post = @topic.posts.find(params[:id])
    @comments = @post.commets.paginate(page: params[:page], per_page: 10)
    authorize @topic
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = Comment.new
      authorize @comment
  end

   def create
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])
#      @comment = current_user.comments.create(comment_params)
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id
        authorize @comment

     if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to topic_post_path(@topic.id, @post.id)  
     else
       flash[:error] = "There was an error saving the Commnet. Please try again."
       render :new
     end
   end


  def destroy
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
