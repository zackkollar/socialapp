class CommentsController < ApplicationController
  def create
    if Comment.create(comment_params)
      redirect_to :back
    else
      redirect_to :root
    end
  end

  def update
    if Comment.update_attributes(comment_params)
      redirect_to :back
    end
  end

  def destroy
    if Comment.destroy(comment_params)
      redirect_to :back
    end
  end
    
  private
  def comment_params
    params.require(:comment).permit!
  end
end
