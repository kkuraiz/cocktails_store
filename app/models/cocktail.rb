class Cocktail < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :ingredients

  # validates :cocktail_name, :ingredient, :price, :category, presence: true
  # validates :price, numericality: true
  # serialize :ingredients
end
