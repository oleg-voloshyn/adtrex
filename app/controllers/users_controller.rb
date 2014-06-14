class UsersController < ApplicationController
  before_filter :correct_user,  only: [:edit, :update]
  before_filter :find_user,     only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def correct_user
    redirect_to(root_path) unless current_user?(@user)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
