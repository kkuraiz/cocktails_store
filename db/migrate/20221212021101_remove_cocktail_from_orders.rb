class RemoveCocktailFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :cocktail_id
  end
end
