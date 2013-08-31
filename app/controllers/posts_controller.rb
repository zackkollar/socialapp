class PostsController < ApplicationController
  before_filter :authenticate_bit!
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :back
    else
      flash[:notice] = @post.errors
      redirect_to :back
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(post_params)
      redirect_to :back
    else
      flash[:alert] = "Your post didn't make it through. Please try again."
      redirect_to :back
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    if @post.destroy
      redirect_to :back
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:bit_id, :body)
  end
end
