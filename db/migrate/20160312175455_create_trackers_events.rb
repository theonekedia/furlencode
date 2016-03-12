class CreateTrackersEvents < ActiveRecord::Migration
  def change
    create_table :trackers_events do |t|
      t.integer :tracker_id
      t.string :event_name
      t.string :value
      
      t.timestamps null: false
    end
  end
end
