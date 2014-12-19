class ListsController < ApplicationController
  before_action :authenticate_user! #:logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

def show
  @list = List.find(params[:id])
  #@list = List.all
  @list = current_user.list
  user_id = params[:id]
  @items = Item.find(list_id)
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
     redirect_to lists_show_path 
             else
                  render 'new'
             end
  end

  def edit
    @list = List.find(params[:id])
  end


  def update
    @list = List.find(params[:id])
    @list.update
  end

  def delete

  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :title)                                                                         
  end
end
