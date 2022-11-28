class Ingredient < ApplicationRecord
    has_and_belongs_to_many :cocktails

    validates :ingredient_name, presence: true
end
