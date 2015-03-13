class CommentsController < ApplicationController
  respond_to :html, :js
  before_action :authenticate_user!

  /#def show
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
  end #/

   def create
      @post = Post.find(params[:post_id])
      @comments = @post.comments

      @comment = current_user.comments.build(comment_params)
      @comment.post = @post
      @new_comment = Comment.new
      #@comment.user_id = current_user.id
        authorize @comment

     if @comment.save
       flash[:notice] = "Comment was saved."
       #redirect_to topic_post_path(@topic.id, @post.id)  
     else
       flash[:error] = "There was an error saving the Commnet. Please try again."
       #render :new
     end
      
      respond_to do |format|
      format.html
      format.js #{ redirect_to [@post.topic, @post]}
    end
   end


  def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
     end
      respond_with(@comment) do |format|
        format.html 
        format.js
        #{redirect_to [@post.topic, @post]}
    end
   end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
