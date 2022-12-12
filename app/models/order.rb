class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates :user, :total_price, presence: true
  validates :total_price, numericality: true
  # validates :item_count, numericality: { only_integer: true }
end
