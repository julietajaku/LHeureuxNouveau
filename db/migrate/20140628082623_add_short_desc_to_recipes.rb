class AddShortDescToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :short_desc, :text
  end
end
