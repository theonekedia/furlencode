class CreateUsersVisits < ActiveRecord::Migration
  def change
    create_table :users_visits do |t|
      t.datetime :date
      t.boolean :status
    end
  end
end
