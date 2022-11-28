class CreateCocktails < ActiveRecord::Migration[7.0]
  def change
    create_table :cocktails do |t|
      t.string :cocktail_name
      t.text :ingredients
      t.decimal :price
      t.text :instruction
      t.references :category, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
