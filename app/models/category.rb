class Category < ApplicationRecord
    has_many :cocktails

    validates :category_name, :cocktail, presence: true
end
