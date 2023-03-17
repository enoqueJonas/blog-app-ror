class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params_provider)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      flash[:notice] = 'Comment created succesfully'
      redirect_to user_post_url(user_id: params[:user_id], id: params[:post_id])
    else
      flash[:alert] = 'Failed to create new comment!'
      render :new
    end
  end

  def params_provider
    params.require(:comment).permit(:text)
  end
end
