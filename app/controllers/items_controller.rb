class ItemsController < ApplicationController
  before_action :authenticate_user! 

def show
  @items = Item.find(params[:list_id])
end

  def new
#    pry.binding
     @list_id = params[:list_id]
     @item = Item.new
  end


  def create
    @item = Item.new(item_params)
              if @item.save
                @list_id = @item.list_id
                   flash[:success] = "New item has been created!"
                   redirect_to list_path(@list_id)  #items_show_path 
             else
                  render 'new'
             end
  end

  def edit
    if params[:status_id] = 1
      @list_id = params[:list_id] 
      @item = Item.find(params[:id])
      @item.update(:status_id => 1)
      redirect_to list_path(@item.list_id)
    else
      @item = Item.find(params[:id])
    end
  end

  def complete

    @item = Item.find(params[:item_id])
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
    params.require(:item).permit(:list_id, :name, :status_id)                                                                         
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
