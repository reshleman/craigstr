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
      redirect_to [@location, @post.category]
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to [post.category.location, post.category]
  end

  def edit
    @post = Post.find(params(:id))
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to [@post.category.location, @post.category, @post]
    else
      render :edit
    end
  end

  private

  def post_params
    params.
      require(:post).
      permit(:title, :body, :image).
      merge(category_id: params[:category_id])
  end
end
