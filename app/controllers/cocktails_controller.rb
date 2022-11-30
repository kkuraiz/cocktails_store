class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.includes(:category).order(cocktail_name: :asc).page(params[:page])
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all.order(ingredient_name: :asc)
  end
end
