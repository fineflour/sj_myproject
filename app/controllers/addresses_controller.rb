class AddressesController < ApplicationController
  
  def new
#    pry.binding
     @user_id = current_user.id
     @address = Address.new
  end

  def create
    @address = Address.new(address_params)
              if @address.save
                   flash[:success] = "New Address has been added!"
     redirect_to lists_path 
             else
                  render 'new'
             end
  end

  def index
    @addresses = Address.all.order('id desc')
  end

  def show
    @addresses = Address.find_by_user_id(current_user.id)
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
