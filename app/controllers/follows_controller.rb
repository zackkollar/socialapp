class FollowsController < ApplicationController
  before_filter :authenticate_bit!
  
  def create
    @follow = Follow.new(follow_params)
    if @follow.save
      redirect_to :back
    else
      flash[:alert] = "Something went wrong."
      redirect_to :back
    end
  end

  def destroy
    @follow = Follow.where({:follow_id => params[:id], :bit_id => current_bit.id}).first
    if Follow.destroy(@follow.id)
      redirect_to :back
    else
      flash[:alert] = "OOPS"
      redirect_to :back
    end
  end
  
  private
  def follow_params
    params.require(:follow).permit(:bit_id, :follow_id)
  end
end
