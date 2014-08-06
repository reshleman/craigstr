class PostsController < ApplicationController
  def new
    @post = Post.new
    @category = Category.find(params[:category_id])
    @location = Location.find(params[:location_id])
  end

  def create
    @location = Location.find(params[:location_id])
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to location_category_path(@location, @post.category)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.
      require(:post).
      permit(:title, :body).
      merge(category_id: params[:category_id])
  end
end
