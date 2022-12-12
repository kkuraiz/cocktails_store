class AddAndRemoveColumns < ActiveRecord::Migration[7.0]
  def change
     add_column :users, :address, :string
     add_column :orders, :address, :string
     remove_column :orders, :cocktail
  end
end
