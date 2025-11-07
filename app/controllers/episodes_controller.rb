class EpisodesController < ApplicationController
  def index
    @episodes = Episode.order(:season, :episode_number).page(params[:page]).per(15)
  end

  def show
    @episode = Episode.find(params[:id])
  end
end
