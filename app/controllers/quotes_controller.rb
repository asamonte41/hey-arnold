class QuotesController < ApplicationController
  def index
    @quotes = Quote.includes(:character, :episode).all
  end
end
