class UsersController < ApplicationController
  def show
    @user = User.find(params[:id] || current_user.id)
    @podcasts = @user.podcasts
  end
end
