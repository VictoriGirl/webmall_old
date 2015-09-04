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
    session[:previous_url] = request.fullpath if allowed?(request) && !request.xhr? # don't store ajax calls
  end

  def after_sign_in_path_for(_resource)
    session[:previous_url] || root_path
  end

  private

  def allowed?(r)
    r.path != '/users/sign_in' && r.path != '/users/sign_up' &&
      r.path != '/users/password/new' && r.path != '/users/password/edit' &&
      r.path != '/users/confirmation' && r.path != '/users/sign_out'
  end
end
