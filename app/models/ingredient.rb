class Ingredient < ApplicationRecord
    validates :ingredient_name, presence: true
end
