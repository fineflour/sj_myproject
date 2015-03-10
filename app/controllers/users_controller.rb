class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else

      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
 end

  def show
  #  if current_user
      @user = User.find(params[:id])
      @posts = @user.posts.visible_to(current_user)
      @comments = @user.comments
      #@address = Address.find(1)
      #@addresses = @user.addresses.where(user_id: params[:id]).all #.where('status_id= 1').first
      #@state = State.find(@address.state_id)
#.where(user_id: params[:id]).first
#(cast(user_id as integer) => current_user.id).where("status = 1").order('id desc').first

      respond_to do |format|
         format.html # show.html.erb
         format.xml { render :xml => @user }
      end

 #   else
 #     redirect_to user_session_path
 #   end
  end

  def user_params
    params.required(:user).permit(:name, :avatar)
  end

end
