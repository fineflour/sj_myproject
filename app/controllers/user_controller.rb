class UserController < ApplicationController 

  def home
#    super
#    render :json => {:id => current_user.id}.to_json
#    @user = session[:current_user]
    id = current_user.id
    c = User.find(id)
    @email = c.email
  end
end
