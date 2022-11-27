class Order < ApplicationRecord
  belongs_to :user
  has_many :cocktail

  validate :user, :total_price, :item_count, presence: true
  validates :total_price, numericality: true
  validate :items_count, numericality: { only_integer: true }
end
