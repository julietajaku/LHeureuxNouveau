class RemoveNameFromIngredient < ActiveRecord::Migration
  def change
    remove_column :ingredients, :name, :string
  end
end
