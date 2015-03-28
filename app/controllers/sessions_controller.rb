class SessionsController < ApplicationController
  skip_before_action :require_user
  before_action :require_guest, except: :destroy

  def new
    @user_session = Session.new
  end

  def create
    @user_session = Session.new(params[:session])
    if @user_session.valid?
      session[:user_id] = @user_session.user_id
      redirect_to :welcome
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :welcome
  end
end
