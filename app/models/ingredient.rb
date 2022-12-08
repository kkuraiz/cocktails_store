class Ingredient < ApplicationRecord
    has_many :cocktail_ingredient
    has_many :cocktails, through: :cocktail_ingredient

    validates :ingredient_name, presence: true
    validates :ingredient_name, uniqueness: true
end
