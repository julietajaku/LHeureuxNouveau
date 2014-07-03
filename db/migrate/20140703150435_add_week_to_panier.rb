class AddWeekToPanier < ActiveRecord::Migration
  def change
    add_column :paniers, :week_id, :integer
  end
end
