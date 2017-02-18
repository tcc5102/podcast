class PodcastsController < ApplicationController
  def index
    @user = current_user
    @podcasts = @user.podcasts
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  def create
    @user = current_user
    @podcast = Podcast.new(params.require(:podcast).permit(:title, :link, :days, :episode, :last_title))
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
      redirect_to :back
    else
      flash.now[:alert] = "There was an error updating the podcast. Please try again."
      redirect_to :back
    end
  end

  def schedule
    @user = current_user
    @podcasts = @user.podcasts
  end

  def podcast_params
    params.require(:podcast).permit(:title, :link, :days, :episode, :last_title)
  end
end
