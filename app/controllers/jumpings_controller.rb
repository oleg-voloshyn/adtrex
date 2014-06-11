class JumpingsController < ApplicationController
  def new
    @jumping = Jumping.new
  end

  def show
    @jumping = Jumping.find(params[:id])
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

  def jumping_params
    params.require(:jumping).permit(:name, :height, :free_height)
  end
end
