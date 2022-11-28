class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.includes(:category)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end
end
