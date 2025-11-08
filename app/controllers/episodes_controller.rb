class EpisodesController < ApplicationController
  def index
    @episodes = Episode.page(params[:page]).per(10) # Kaminari pagination
  end

  def show
    @episode = Episode.find_by(id: params[:id])
    if @episode.nil?
      redirect_to episodes_path, alert: "Episode not found."
      return
    end
    @characters = @episode.characters
    @quotes = @episode.quotes
  end
end
