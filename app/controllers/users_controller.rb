class UsersController < ApplicationController
  skip_before_action :require_user
  before_action :require_guest, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      token = verifier.generate(id: @user.id)
      UserMailer.confirmation(@user, token).deliver_later
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    if current_user
      @user = current_user
    else
      @user = User.find(user_verifier[:id])
      if @user
        @user.confirm!
        sign_in(@user)
        redirect_to :root
      end
    end
    redirect_to :root unless @user
  end

  def update
    @user = current_user || User.find(user_verifier[:id])
    if @user.update_attributes(user_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    reset_session
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def user_verifier
    verifier.verify(params[:token])
  end
end
