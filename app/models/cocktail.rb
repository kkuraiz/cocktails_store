class Cocktail < ApplicationRecord
  belongs_to :category

  validates :cocktail_name, :ingredients, :price, :category, presence: true
  validates :price, numericality: true
  serialize :ingredients, Array
  validates :cocktail_name, uniqueness: true
end
