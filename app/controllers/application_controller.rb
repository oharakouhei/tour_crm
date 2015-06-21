class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :family_name
    devise_parameter_sanitizer.for(:sign_up) << :given_name
    devise_parameter_sanitizer.for(:sign_up) << :image_url
    devise_parameter_sanitizer.for(:account_update) << :family_name
    devise_parameter_sanitizer.for(:account_update) << :given_name
    devise_parameter_sanitizer.for(:account_update) << :image_url
  end
end
