class RemovePriceFromIngredient < ActiveRecord::Migration
  def change
    remove_column :ingredients, :price, :float
  end
end
