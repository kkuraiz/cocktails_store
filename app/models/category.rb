class Category < ApplicationRecord
    has_many :cocktails

    validates :category_name, presence: true
end
