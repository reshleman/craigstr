class PostsController < ApplicationController
   before_action :require_login, except: [:index, :create] #added for testing purposes since no root_path defined

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(new_post_params)
    @post.save
    redirect_to posts_path
    end
  private
  def new_post_params
  params.require(:post).permit(:title, :body).merge(user: current_user)
end

end


