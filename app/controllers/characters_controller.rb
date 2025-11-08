class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find_by(id: params[:id])
    if @character.nil?
      redirect_to characters_path, alert: "Character not found."
      return
    end

    @episodes = @character.episodes if @character.respond_to?(:episodes)
    @quotes = @character.quotes if @character.respond_to?(:quotes)
  end
end
