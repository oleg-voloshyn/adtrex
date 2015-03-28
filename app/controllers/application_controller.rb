class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :require_user
  # before_action :authenticate

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_user
    redirect_to root_path unless current_user
  end

  def require_guest
    redirect_to root_path if current_user
  end

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def verifier
    @verifier ||= ActiveSupport::MessageVerifier.new(Rails.application.secrets[:secret_key_base], url_safe: true)
  end

  def sign_in(user)
    session[:user_id] = user.id if user.confirmed?
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.secrets[:admin_username] && password == Rails.application.secrets[:admin_password]
    end
  end
end
