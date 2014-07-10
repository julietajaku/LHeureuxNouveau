class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.date :start,	:null => false

      t.timestamps
    end
  end
end
