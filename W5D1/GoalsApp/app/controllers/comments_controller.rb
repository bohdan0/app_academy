class CommentsController < ApplicationController

  def create
    # debugger
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.save
    flash[:errors] = @comment.errors.full_messages
      if @comment.commentable_type == "User"
        redirect_to user_url(@comment.commentable.id)
      else
        redirect_to goal_url(@comment.commentable.id)
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if @comment.commentable_type == "User"
      redirect_to user_url(@comment.commentable_id)
    else
      redirect_to goal_url(@comment.commentable_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :author_id)
  end
end
