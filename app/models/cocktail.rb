class Cocktail < ApplicationRecord
  belongs_to :category
  has_many :ingredient

  # validates :cocktail_name, :ingredient, :price, :category, presence: true
  # validates :price, numericality: true
  serialize :ingredient
end
