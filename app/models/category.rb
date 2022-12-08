class Category < ApplicationRecord
    has_many :cocktails

    validates :category_name, presence: true

    def to_s
        category_name
    end
end
