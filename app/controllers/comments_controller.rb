class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to :back, :anchor => "post_"+@comment.post_id.to_s
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
