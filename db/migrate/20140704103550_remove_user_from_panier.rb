class RemoveUserFromPanier < ActiveRecord::Migration
  def change
    remove_column :paniers, :user_id, :string
  end
end
