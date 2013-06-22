class CreateFavoriteActivities < ActiveRecord::Migration
  def change
    create_table :favorite_activities do |t|
      t.string :name, null: false
      t.string :description
      t.text :note
      t.integer :rating
      t.integer :child_account_id, null: false
      t.integer :activity_category_id, null: false

      t.timestamps
    end
  end
end
