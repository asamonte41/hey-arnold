class CharactersController < ApplicationController
  def index
    @query = params[:query]
    @location_filter = params[:location]

    @characters = Character.includes(:location).all

    if @query.present?
      @characters = @characters.where("name LIKE ? OR role LIKE ?", "%#{@query}%", "%#{@query}%")
    end

    if @location_filter.present? && @location_filter != "All Locations"
      @characters = @characters.joins(:location).where(locations: { name: @location_filter })
    end
  end

  def show
    @character = Character.find_by(id: params[:id])
    if @character.nil?
      redirect_to characters_path, alert: "Character not found."
    end
  end
end
