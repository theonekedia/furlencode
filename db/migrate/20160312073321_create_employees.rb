class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :username
      t.string :password

      t.timestamps null: false
    end
  end
end
