class QuotesController < ApplicationController
  def index
    @query = params[:query]
    @character_filter = params[:character]

    @quotes = Quote.includes(:character, :episode).all

    # Filter by quote text
    if @query.present?
      @quotes = @quotes.where("text LIKE ?", "%#{@query}%")
    end

    # Filter by character
    if @character_filter.present? && @character_filter != "All Characters"
      @quotes = @quotes.joins(:character).where(characters: { name: @character_filter })
    end

    @quotes = @quotes.order(:created_at)
  end
end
