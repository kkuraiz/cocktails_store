class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cocktail, null: true, foreign_key: true
      t.decimal :total_price
      t.integer :item_count
      
      t.timestamps
    end
  end
end
