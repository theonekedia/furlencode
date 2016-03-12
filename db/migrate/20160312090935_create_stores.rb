class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.point :coordinates, srid: 4326, :geographic => true
      t.string :rating

      t.timestamps null: false
    end
    add_index :stores, :coordinates, spatial: true
  end
end
