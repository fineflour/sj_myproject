class VotesController < ApplicationController

def up_vote
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first
    update_vote!(1)
    redirect_to :back
  end

  def down_vote
   @topic = Topic.find(params[:topic_id])
   @post = @topic.posts.find(params[:post_id])
   @vote = @post.votes.where(user_id: current_user.id).first
    update_vote!(-1)
    redirect_to :back
  end

private

  def update_vote!(new_value)
    if @vote
       authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else
       @vote = current_user.votes.create(value: new_value, post: @post)
       @vote = current_user.votes.build(value: new_value, post: @post)
       authorize @vote, :create?
       @vote.save
    end
  end

end
