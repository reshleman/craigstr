class Admin::DashboardsController < AdminController
  def show
    @posts = Post.flagged
  end
end
