class HomeController < ApplicationController
  
  def show
    if current_user
      id = current_user.id
      c = User.find(id)
      @email = c.email
      
    else 
      
    end
  end

  def index
    if current_user
      #redirect_to home_show_path 
      #redirect_to list_path 

    else
      redirect_to user_session_path
    end
  end
end
