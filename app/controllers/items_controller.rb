class ItemsController < ApplicationController
  before_action :authenticate_user! 

def show
  @items = Item.find(params[:list_id])
end

  def new
#    pry.binding
     @item = Item.new
  end


  def create
    @item = Item.new(item_params)
              if @item.save
                   flash[:success] = "New item has been created!"
     redirect_to items_show_path 
             else
                  render 'new'
             end
  end

  def edit
    @item = Item.find(params[:id])
  end


  def update
    @item = Item.find(params[:id])
    @item.update
  end

  def delete

  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private
  def item_params
    params.require(:item).permit(:list_id, :name)                                                                         
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
