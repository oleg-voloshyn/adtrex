class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  helper_method :current_user

end
