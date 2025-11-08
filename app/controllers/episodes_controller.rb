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
class EpisodesController < ApplicationController
  def index
    @query = params[:query]
    @season_filter = params[:season]

    @episodes = Episode.all

    # Filter by title or synopsis
    if @query.present?
      @episodes = @episodes.where("title LIKE ? OR synopsis LIKE ?", "%#{@query}%", "%#{@query}%")
    end

    # Filter by season
    if @season_filter.present? && @season_filter != "All Seasons"
      @episodes = @episodes.where(season: @season_filter)
    end

    @episodes = @episodes.order(:season, :episode_number)
  end

  def show
    @episode = Episode.find_by(id: params[:id])
    if @episode.nil?
      redirect_to episodes_path, alert: "Episode not found."
      return
    end

    @characters = @episode.characters
  end
end
