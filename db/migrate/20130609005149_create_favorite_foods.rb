class CreateFavoriteFoods < ActiveRecord::Migration
  def change
    create_table :favorite_foods do |t|
      t.string :name
      t.integer :child_account_id, :null => false
      t.string :food_category
      t.integer :food_id
      t.string :food_type
      t.text :note
      t.integer :rating
      t.boolean :share_with_others, :default => false

      t.timestamps
    end
  end
end
