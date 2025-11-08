class CharactersController < ApplicationController
  def index
    @query = params[:query]

    if params[:query].present?
      query = "%#{params[:query]}%"

      if ActiveRecord::Base.connection.adapter_name.downcase.starts_with?("sqlite")
        # SQLite-compatible (case-insensitive search)
        @characters = Character.where("LOWER(name) LIKE LOWER(?) OR LOWER(role) LIKE LOWER(?)", query, query)
      else
        # PostgreSQL or MySQL
        @characters = Character.where("name ILIKE ? OR role ILIKE ?", query, query)
      end
    else
      @characters = Character.all
    end

    @characters = @characters.order(:name).page(params[:page]).per(20)
  end
end
