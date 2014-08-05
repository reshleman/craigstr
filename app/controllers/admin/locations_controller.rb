class Admin::LocationsController < AdminController
  def new
    @location = Location.new
  end
end
