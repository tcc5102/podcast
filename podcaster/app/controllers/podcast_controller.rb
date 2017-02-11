class PodcastController < ApplicationController
  def index
    @user = current_user
    @podcasts = @user.podcasts
  end

  def show
    @user = User.find(params[:id] || current_user.id)
    @podcasts = @user.podcasts
  end

  def create
    @user = current_user
    @podcast = Podcast.new(params.require(:podcast).permit(:title, :link))
    @podcast.user_id = @user.id

    if @podcast.save
      flash[:notice] = "Podcast #{@podcast.title} Now in List"
      redirect_to :back
    end
  end

  def destroy
    @user = current_user
    @podcast = Podcast.find(params[:id])
    @podcast.destroy
    redirect_to :back
  end


  def edit
    @podcast = Podcast.find(params[:id])
  end

  def update
    @podcast = Podcast.find(params[:id])
    @podcast.assign_attributes(podcast_params)
    if @podcast.save
      flash[:notice] = "Podcast was updated."
      redirect_to podcast_show_path
    else
      flash.now[:alert] = "There was an error updating the podcast. Please try again."
      redirect_to :back
    end
  end

  def podcast_params
    params.require(:podcast).permit(:title, :link)
  end
end
