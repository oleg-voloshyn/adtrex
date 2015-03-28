class PasswordResetsController < ApplicationController
  skip_before_action :require_user
  before_action :require_guest, only: [:new, :create]

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])
    if user = @session.user
      token = verifier.generate(id: user.id, expires_at: Time.now + 1.hour)
      UserMailer.reset_password(user, token).deliver_later
      redirect_to root_path
    else
      @session.errors.add(:email, :user_invalid)
    end
  end

  def edit
    if user_verifier[:expires_at] < 1.hour.ago
      redirect_to new_password_reset_path
    end
  end

  def update
    if user_verifier && user.update(user_params)
      reset_session
      session[:auth_token] = user.token
      sign_in(user)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user
    @user ||= User.find(user_verifier[:id])
  end
  helper_method :user

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_verifier
    verifier.verify(params[:id])
  end
end
