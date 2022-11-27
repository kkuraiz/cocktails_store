class Ingredient < ApplicationRecord
    has_many :cocktails

    validates :ingredient_name, :cocktail, presence: true
end
