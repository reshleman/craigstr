class CategoriesController < ApplicationController
  def show
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:id])
    #@posts = @category.posts
    @posts = @category.posts.order(:title).post params[:post]
  end
end
