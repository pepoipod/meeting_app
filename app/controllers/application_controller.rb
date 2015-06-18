class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def sign_in_required
      redirect_to new_user_session_path unless user_signed_in?
    end

  protected

   def configure_permitted_parameters
      # sign_inのときに、emailも許可する
      devise_parameter_sanitizer.for(:sign_in) << :email
      # sign_upのときに、emailも許可する
      devise_parameter_sanitizer.for(:sign_up) << :email
      #  account_updateのときに、emailも許可する
      devise_parameter_sanitizer.for(:account_update) << :email
   end
end
