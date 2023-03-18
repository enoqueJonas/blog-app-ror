class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = current_user
    @like.post = Post.find(params[:post_id])
    if @like.save
      flash[:notice] = 'Like created succesfully'
      redirect_to user_post_url(user_id: params[:user_id], id: params[post_id])
    else
      flash[:alert] = 'Failed to create like!'
      render :new
    end
  end
end
