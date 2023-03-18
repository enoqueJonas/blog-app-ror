class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_provider)
    @post.user = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to user_posts_url(current_user)
    else
      flash[:alert] = 'Could not create post!'
      render :new
    end
  end

  def params_provider
    params.require(:post).permit(:title, :text)
  end
end
