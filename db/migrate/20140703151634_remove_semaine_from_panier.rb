class RemoveSemaineFromPanier < ActiveRecord::Migration
  def change
    remove_column :paniers, :semaine, :date
  end
end
