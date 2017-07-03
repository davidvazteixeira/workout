class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_params, if: :devise_controller?

  protected

    def configure_devise_permitted_params
      devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :last_name])
      devise_parameter_sanitizer.permit(:sign_in, keys:[:first_name, :last_name])
    end

end
