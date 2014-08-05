class HomesController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def show
    @user = User.new
  end
end
