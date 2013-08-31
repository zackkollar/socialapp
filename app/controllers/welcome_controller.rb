class WelcomeController < ApplicationController
  def index
    if bit_signed_in?
      @posts = current_bit.following_posts
      @post = Post.new
    end
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end
end
