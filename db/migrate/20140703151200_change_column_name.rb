class ChangeColumnName < ActiveRecord::Migration
  def change
rename_column :weeks, :first, :start

  end
end
