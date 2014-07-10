class CreateJoinTableProductRecipe < ActiveRecord::Migration
  def change
    create_join_table :products, :recipes, id: false do |t|
	  t.float :quantity, 					:null => false
      t.index [:product_id, :recipe_id]
      # t.index [:recipe_id, :product_id]
    end
  end

end
