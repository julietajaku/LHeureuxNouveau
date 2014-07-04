class AddProductRefToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :product_id, :reference
  end
end
