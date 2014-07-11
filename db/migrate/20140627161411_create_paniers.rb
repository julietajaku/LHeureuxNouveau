class CreatePaniers < ActiveRecord::Migration
  def change
    create_table :paniers do |t|
      t.float :coute
      t.belongs_to :user
      t.belongs_to :week

      t.timestamps
    end

    add_index :paniers, [:user_id, :week_id], :unique => true
  end
end
