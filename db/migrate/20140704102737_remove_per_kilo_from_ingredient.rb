class RemovePerKiloFromIngredient < ActiveRecord::Migration
  def change
    remove_column :ingredients, :per_kilo, :boolean
  end
end
