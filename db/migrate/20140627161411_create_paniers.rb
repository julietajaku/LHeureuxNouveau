class CreatePaniers < ActiveRecord::Migration
  def change
    create_table :paniers do |t|
      t.date :semaine
      t.float :coute

      t.timestamps
    end
  end
end
