class Ingredient < ApplicationRecord
    has_many :cocktails

    validates :ingredient_name, presence: true
end
