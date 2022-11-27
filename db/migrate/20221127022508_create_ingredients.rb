class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :ingredient_name
      t.references :cocktail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
