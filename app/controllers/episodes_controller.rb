class EpisodesController < ApplicationController
  def index
    @episodes = Episode.paginate(page: params[:page], per_page: 10)
  end

  def show
    @episode = Episode.find_by(id: params[:id])
    if @episode.nil?
      redirect_to episodes_path, alert: "Episode not found."
      return
    end

    @characters = @episode.characters if @episode.respond_to?(:characters)
    @quotes = @episode.quotes if @episode.respond_to?(:quotes)
  end
end
