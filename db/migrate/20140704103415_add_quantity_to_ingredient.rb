class AddQuantityToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :quantity, :float
  end
end
