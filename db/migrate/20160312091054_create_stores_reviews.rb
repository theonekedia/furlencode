class CreateStoresReviews < ActiveRecord::Migration
  def change
    create_table :stores_reviews do |t|
      t.boolean :liked
      t.text :critic
      t.integer :user_id
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
