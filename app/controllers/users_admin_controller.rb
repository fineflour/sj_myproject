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
    #redirect_to users_admin_show_path(:id => params[:id]) 
  end

  def edit
    @user = User.find(params[:id])
  end

 private
  def user_params
    params.require(:user).permit(:name, :email)                                                                         
  end
end
