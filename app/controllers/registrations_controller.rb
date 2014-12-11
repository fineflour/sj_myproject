class RegistrationsController < Devise::RegistrationsController 

  prepend_before_filter :require_no_authentication, :only => [:action1, :action2]

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
