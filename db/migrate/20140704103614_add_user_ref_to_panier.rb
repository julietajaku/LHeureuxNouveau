class AddUserRefToPanier < ActiveRecord::Migration
  def change
    add_column :paniers, :user_id, :reference
  end
end
