class EpisodesController < ApplicationController
  def index
    @episodes = Episode.order(:season, :episode_number).page(params[:page]).per(15)
  end

 def show
  @episode = Episode.find(params[:id])
  @characters = @episode.characters # assuming Episode `has_many :characters, through: :episode_characters`
  @quotes = @episode.quotes         # assuming Episode `has_many :quotes`
  end
end
