# ApplicationController
class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  after_action :store_location
  protect_from_forgery with: :exception

  protected

  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role
  end

  def store_location
    return unless request.get?
    if request.path != '/users/sign_in' &&
       request.path != '/users/sign_up' &&
       request.path != '/users/password/new' &&
       request.path != '/users/password/edit' &&
       request.path != '/users/confirmation' &&
       request.path != '/users/sign_out' &&
       !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(_resource)
    session[:previous_url] || root_path
  end
end
