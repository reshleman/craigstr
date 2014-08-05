class Admin::CategoriesController < AdminController

  def new
    @location = Location.find(params[:location_id])
    @category = Category.new
  end

  def create
    @location = Location.find(params[:location_id])
    @category = @location.categories.create(category_params)

    if @category.save
      redirect_to @location
    else
      render :new
    end
  end

  private

  def category_params
    params.
      require(:category).
      permit(:name)
  end
end
