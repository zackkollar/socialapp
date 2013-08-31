class ProfileController < ApplicationController
  before_filter :authenticate_bit!, except: [:show, :explore]
  
  def explore
    @bits = Bit.last(10)
  end
  def show
    @bit = Bit.find_by_id(params[:id])
    redirect_to(root_url, :notice => 'Profile not found!') unless @bit
    @profile = @bit.profile
    @post = Post.new
    if bit_signed_in?
      @follow = current_bit.follows.where({:bit_id => current_bit.id, :follow_id => @bit.id})
    end
  end
  
  def edit
    if bit_signed_in?
      @bit = Bit.find_by_id(current_bit.id)
      @profile = @bit.profile
    end
  end
  
  def update
    @profile = Profile.find_by_bit_id(current_bit.id)
    if @profile.update_attributes(profile_params)
      redirect_to :root
    else
      flash[:alert] = "Something went wrong!"
      redirect_to :root
    end
  end
  private
  def profile_params
    params.require(:profile).permit(:bit_id, :avatar, :avatar_file_name, :bio, :firstname, :lastname, :location)
  end
end
