class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.belongs_to :product
      t.belongs_to :recipe
      t.float :quantity

      t.timestamps
    end

    add_index :ingredients, [:product_id, :recipe_id], :unique => true

  end

end
