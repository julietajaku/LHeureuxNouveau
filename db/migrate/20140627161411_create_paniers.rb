class CreatePaniers < ActiveRecord::Migration
  def change
    create_table :paniers do |t|
      t.date :semaine
      t.float :coute
      t.belongs_to :user
      t.belongs_to :week

      t.timestamps
    end
  end
end
