class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :price_limit

      t.timestamps null: false
    end
  end
end
