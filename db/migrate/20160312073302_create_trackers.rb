class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :uid
      t.string :event
      t.string :data
      t.string :page

      t.timestamps null: false
    end
  end
end
