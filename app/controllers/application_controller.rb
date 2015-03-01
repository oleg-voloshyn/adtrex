class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  include SessionsHelper

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  helper_method :current_user

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
