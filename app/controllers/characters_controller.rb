class CharactersController < ApplicationController
  def index
    @query = params[:query]
    @characters = Character.all
    if @query.present?
      @characters = @characters.where("name ILIKE ? OR role ILIKE ?", "%#{@query}%", "%#{@query}%")
    end
    @characters = @characters.order(:name).page(params[:page]).per(20)
  end

  def show
    @character = Character.find(params[:id])
  end
end
