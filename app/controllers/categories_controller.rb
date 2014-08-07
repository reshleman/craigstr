class CategoriesController < ApplicationController
  def show
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:id])
    @posts = @category.posts.page params[:page]
  end
end
