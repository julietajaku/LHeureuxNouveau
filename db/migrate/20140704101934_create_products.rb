class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, 			:null => false
      t.boolean :par_kilo, 		:null => false, :default => true
      t.float :price,			:null => false
      t.boolean :available, 	:null => false, :default => false 

      t.timestamps
    end

    add_index :products, :name, :unique => true

  end
end
