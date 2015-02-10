class UsersController < ApplicationController

  def show

    if current_user
      @user = User.find(current_user.id)

      respond_to do |format|
         format.html # show.html.erb
         format.xml { render :xml => @user }
      end
    else
      redirect_to user_session_path
    end
  end
end
