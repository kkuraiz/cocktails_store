class Cocktail < ApplicationRecord
  belongs_to :category
  has_many :cocktail_ingredient
  has_many :ingredients, through: :cocktail_ingredient

  validates :cocktail_name, :price, :category, presence: true
  validates :price, numericality: true
  validates :cocktail_name, uniqueness: true
end
