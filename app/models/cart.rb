class Cart < ApplicationRecord
  belongs_to :user
  has_many :cocktails

  validates :user, :total_price, :items_count, presence: true
  validates :total_price, numericality: true
  validate :items_count, numericality: { only_integer: true }
end
