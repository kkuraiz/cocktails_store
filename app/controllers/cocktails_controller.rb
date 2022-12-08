class CocktailsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

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

  def add_to_cart
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)
    session[:quantity].append(1)
    redirect_to root_path
  end
end
