class UsersController < ApplicationController

  def show
    if current_user
      @user = User.find(params[:id])
      #@address = Address.find(1)
      @address = @user.address.where(user_id: params[:id]).where(status_id: 1).first
      @state = State.find(@address.state_id)
#.where(user_id: params[:id]).first
#(cast(user_id as integer) => current_user.id).where("status = 1").order('id desc').first

      respond_to do |format|
         format.html # show.html.erb
         format.xml { render :xml => @user }
      end

    else
      redirect_to user_session_path
    end
  end

  def edit

  end


end
