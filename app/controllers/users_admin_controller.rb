class UsersAdminController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "User successfully updated"
    redirect_to users_admin_path(:id => params[:id]) 

    /#if @message.save
     flash.now[:notice] = 'Message sent!'
    else
     flash.now[:alert] = 'Error while sending message!'
    end#/
  end

  def edit
    @user = User.find(params[:id])
  end

 private
  def user_params
    params.require(:user).permit(:name, :email)                                                                         
  end
end
