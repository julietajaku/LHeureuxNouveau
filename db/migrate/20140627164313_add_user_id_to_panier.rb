class AddUserIdToPanier < ActiveRecord::Migration
  def change
    add_column :paniers, :user_id, :string
  end
end
