class Cocktail < ApplicationRecord
  has_many :ingredients
  belongs_to :category

  validates :cocktail_name, :ingredient, :price, :category, presence: true
  validates :price, numericality: true
end
