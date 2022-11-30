class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.includes(:category).order(cocktail_name: :asc).page(params[:page])
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all.order(ingredient_name: :asc)
  end

  def search
    keyword_search = "%#{params[:keywords]}%"
    category_selected = "%#{params["category"]}%"
    
    if "%#{params["category"]}%"
      @cocktails = Cocktail.where("cocktail_name LIKE ? AND category_id LIKE ?", keyword_search, category_selected).order(cocktail_name: :asc)
      @ingredients = Ingredient.where("ingredient_name LIKE ? ", keyword_search).order(ingredient_name: :asc)
    elsif
      @cocktails = Cocktail.where("cocktail_name LIKE ? ", keyword_search).order(cocktail_name: :asc)
      @ingredients = Ingredient.where("ingredient_name LIKE ? ", keyword_search).order(ingredient_name: :asc)
    end
  end
end
