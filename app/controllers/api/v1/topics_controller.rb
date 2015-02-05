class TopicsController < ApplicationController

  def index
    @topics = Topic.all.order('id desc')
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @user_id = current_user.id                                                                                                     
    @topic = Topic.new   
  end

  def create
    @topic = Topic.new(topic_params)                                                                                                   
    if @topic.save                                                                                                         
      flash[:success] = "New todo has been created!"                                                                   
      redirect_to topics_index_path                                                                                                         
    else                                                                                                                   
      render 'new'                                                                                                      
    end    
  end


  def update


  end

  def edit
  end

  private
  def topic_params                                                
    params.require(:topic).permit(:user_id, :title)                                                                              
  end  
end
