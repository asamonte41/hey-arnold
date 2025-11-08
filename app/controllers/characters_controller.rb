class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find_by(id: params[:id])
    redirect_to characters_path, alert: "Character not found." if @character.nil?
  end
end
