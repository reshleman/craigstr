class SpamFlagsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.flag(post)

    redirect_to [post.category.location, post.category, post]
  end
end
