class CommentsController < ApplicationController
  def index
    
  end

  def show
    @Post = Post.find(params[:id])
    @comments = @post.commets.paginate(page: params[:page], per_page: 10)
    authorize @topic
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
      authorize @comment
  end

   def create
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:post_id])
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


  def edit
  end

  def delete
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
