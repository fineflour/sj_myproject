class UserController < ApplicationController
  def home
    @user = session[:current_user]
  end
end
