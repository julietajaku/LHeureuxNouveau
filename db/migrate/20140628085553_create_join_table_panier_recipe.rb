class CreateJoinTablePanierRecipe < ActiveRecord::Migration
  def change
    create_join_table :paniers, :recipes, id: false do |t|
      t.index [:panier_id, :recipe_id], :unique => true
      t.integer :size, :null => false, :default => 2
    end

  end

end
