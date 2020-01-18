class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  def new
    flash[:danger] = "You aren't authorized to perform that action"
    redirect_to new_user_session_path
  end

  def create
    flash[:danger] = "You aren't authorized to perform that action"
    redirect_to new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end
