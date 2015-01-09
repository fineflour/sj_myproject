class RegistrationsController < Devise::RegistrationsController 

  prepend_before_filter :require_no_authentication, :only => [:action1, :action2]

  def create
  #@user = User.new(params[:user])
  respond_to do|format|
     UserMailer.welcome_email(@user).deliver_later
     format.html { redirect_to(@user, notice: 'User was successfully created.') }
     format.json { render json: @user, status: :created, location: @user }
  end
end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
