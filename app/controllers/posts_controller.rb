class PostsController < ApplicationController
  before_action :require_login, except: [:index, :create] #added for testing purposes since no root_path defined

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :index
    end
  end

  private

  def post_params 
    params.
      require(:post).
      permit(:title, :body)
  end
end


