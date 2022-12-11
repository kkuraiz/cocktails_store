class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @categories = Category.order(category_name: :asc)
  end

  def show
    @category = Category.find(params[:id])
    @cocktails = Cocktail.all.order(cocktail_name: :asc)
  end
end
