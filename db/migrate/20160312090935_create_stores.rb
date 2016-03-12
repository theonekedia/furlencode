class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.float :latitude, :precision => 6, :scale => 4
      t.float :longitude, :precision => 6, :scale => 4
      t.integer :rating
      t.integer	:user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
