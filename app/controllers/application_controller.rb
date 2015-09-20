class ApplicationController < ActionController::Base
	  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

def after_sign_in_path_for(resource)
  admin_companies_path
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "new"
      "login"
    else
      "application"
    end
  end
end
