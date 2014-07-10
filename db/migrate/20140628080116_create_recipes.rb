class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title,			:null => false
      t.text :short_desc		
      t.text :instructions,		:null => false

      t.timestamps
    end
  end
end
