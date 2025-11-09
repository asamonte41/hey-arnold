class EpisodesController < ApplicationController
  def index
    @episodes = Episode.order(:season, :episode_number).page(params[:page]).per(10) # Paginate episodes, 10 per page
  end

  def show
    @episode = Episode.find_by(id: params[:id])
    if @episode.nil?
      redirect_to episodes_path, alert: "Episode not found."
      return
    end

    # Load characters in this episode (through appearances)
    @characters = @episode.characters

    # Load quotes for this episode
    @quotes = @episode.quotes.includes(:character) || []
  end
end
