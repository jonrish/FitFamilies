class ModifyFoodCategory < ActiveRecord::Migration
  def up
  	remove_column :foods, :food_category_id
  	change_column :favorite_foods, :food_category_id, :integer, null: true
  	remove_column :favorite_foods, :share_with_others
  end

  def down
  	add_column :foods, :food_category_id, :integer
  	change_column :favorite_foods, :food_category_id, :integer, null: false
  	add_column :favorite_foods, :share_with_others, :boolean, default: false
  end
end
