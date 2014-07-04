class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :par_kilo
      t.float :price

      t.timestamps
    end
  end
end
