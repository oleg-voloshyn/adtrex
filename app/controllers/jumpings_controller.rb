class JumpingsController < ApplicationController
  before_filter :find_jump, only: [:show, :edit, :update, :destroy]

  def index
    @jumpings = Jumping.all
  end

  def new
    @jumping = Jumping.new
  end

  def create
    @jumping = Jumping.new(jumping_params)
    if @jumping.valid?
      @jumping.save
      render :show
    else
      render :new
    end
  end

  def update
    @jumping.assign_attributes(jumping_params)

    if @jumping.valid?
      @jumping.save
      render :show
    else
      render :edit
    end
  end

  def destroy
    @jumping.destroy
    redirect_to root_path
  end

  private

  def find_jump
    @jumping = Jumping.find(params[:id])
  end

  def jumping_params
    params.require(:jumping).permit(:name, :height, :free_height)
  end
end
