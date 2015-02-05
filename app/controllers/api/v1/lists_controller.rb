class Api::V1::ListsController < ApplicationController
#  before_action :authenticate_user! #:logged_in_user, only: [:index, :edit, :update, :destroy]
#  skip_before_filter  :verify_authenticity_token  
#  before_action :set_lsit, only: [:show]

#http_basic_authenticate_with name: 'admin',  password: 'secret'
before_filter :restrict_access
respond_to :json

  def index
    @lists = List.all.order('id desc')
    
    respond_to do |format|
      format.html
      format.xml{ render xml: @lists }
      format.json { render json: @lists }
    end
  end

  def show
  
  #@list = List.find(params[:id])
  #@list = List.all
  #@list = current_user.list
#  @items = Item.find(list_id)
    @items = Item.where(list_id: params[:id]).all.order('id desc')

    respond_to do |format|
     format.html
     format.xml { render xml: @items }
     format.json { render json: @items }
    end
  end

  def new
#    pry.binding
     @user_id = current_user.id
     @list = List.new
  end


  def create
    @list = List.new(list_params)
             if @list.save
                   flash[:success] = "New todo has been created!"
                redirect_to lists_path 
             else
                  render 'new'
             end
  end

  def edit
    @list = List.find(params[:id])
  end


  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path
  end


  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path  
  end

  private

  def restrict_access
    # This is for passing token through URL
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key 

    # Pass Api Key through Header 
     # authenticate_or_request_with_http_token do |token, options|
        #ApiKey.exist?(:access_token => token)
        #ApiKey.api_params.exist?(:access_token => token)
      #end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:user_id, :title)                                                                         
  end

end
