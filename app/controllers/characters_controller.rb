class CharactersController < ApplicationController
  def index
    @query = params[:query]
    @location_filter = params[:location]

    @characters = Character.includes(:location).all

    if @query.present?
      # SQLite is case-insensitive for LIKE by default on ASCII, but using LOWER makes it safer
      search_term = "%#{@query.downcase}%"
      @characters = @characters.where(
        "LOWER(name) LIKE :q OR LOWER(role) LIKE :q",
        q: search_term
      )
    end

    if @location_filter.present? && @location_filter != "All Locations"
      @characters = @characters.joins(:location)
                               .where(locations: { name: @location_filter })
    end
  end

  def show
    @character = Character.find_by(id: params[:id])
    redirect_to characters_path, alert: "Character not found." if @character.nil?
  end
end
