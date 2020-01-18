class Users::InvitationsController < Devise::InvitationsController
  access all: [:edit, :update], admin: :all
  before_action :configure_permitted_parameters
  layout :set_layout

  def set_layout
    if action_name == 'new'
      "application"
    else
      "auth"
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name])
    end

end
