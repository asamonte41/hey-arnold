class QuotesController < ApplicationController
  def index
    @query = params[:query]
    @character_filter = params[:character]

    @quotes = Quote.includes(:character, :episode).all

    # Filter by quote text (SQLite-safe, case-insensitive)
    if @query.present?
      search_term = "%#{@query.downcase}%"
      @quotes = @quotes.where("LOWER(text) LIKE ?", search_term)
    end

    # Filter by character
    if @character_filter.present? && @character_filter != "All Characters"
      @quotes = @quotes.joins(:character).where(characters: { name: @character_filter })
    end

    # Order by creation and paginate (20 per page)
    @quotes = @quotes.order(:created_at).page(params[:page]).per(20)
  end
end
