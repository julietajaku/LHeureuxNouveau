class AddRecipeRefToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :recipe_id, :reference
  end
end
