class CharactersController < ApplicationController
  def index
    @query = params[:query]
    @location_filter = params[:location]

    # Start with all characters including their locations
    @characters = Character.includes(:location).all

    # Apply search filter
    if @query.present?
      search_term = "%#{@query.downcase}%"
      @characters = @characters.where(
        "LOWER(name) LIKE :q OR LOWER(role) LIKE :q",
        q: search_term
      )
    end

    # Apply location filter
    if @location_filter.present? && @location_filter != "All Locations"
      @characters = @characters.joins(:location)
                               .where(locations: { name: @location_filter })
    end

    # Apply pagination: 9 characters per page
    @characters = @characters.page(params[:page]).per(9)
  end

  def show
    @character = Character.find_by(id: params[:id])
    redirect_to characters_path, alert: "Character not found." if @character.nil?
  end
end
