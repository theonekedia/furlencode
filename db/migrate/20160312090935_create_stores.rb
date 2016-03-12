class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.point :coordinates, srid: 4326, :geographic => true
      t.integer :rating
      t.integer	:user_id

      t.timestamps null: false
    end
  end
end
