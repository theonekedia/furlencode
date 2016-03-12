class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.point :latitude
      t.point :longitude
      t.integer :rating
      t.integer	:user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
