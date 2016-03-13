class CreateUsersVisits < ActiveRecord::Migration
  def change
    create_table :users_visits do |t|
      t.datetime :date
      t.boolean :status
      t.integer :store_id
      t.integer :user_id
      t.string :purpose
    end
  end
end
