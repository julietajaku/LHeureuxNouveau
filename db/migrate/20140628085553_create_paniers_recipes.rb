class CreatePaniersRecipes < ActiveRecord::Migration
  def self.up
    create_table :paniers_recipes, :id => false do |t|
    	t.integer :panier_id
    	t.integer :recipe_id
    end

      add_index :paniers_recipes, [:panier_id, :recipe_id]
  end

  def self.down
    drop_table :paniers_recipes
  end

end
