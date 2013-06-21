class ModifyFavoriteFoodsTable < ActiveRecord::Migration
  def up
    add_column :favorite_foods, :food_type_id, :integer, null: false
    add_column :favorite_foods, :food_category_id, :integer, null: false
    remove_column :favorite_foods, :food_category
    remove_column :favorite_foods, :food_type
    remove_column :favorite_foods, :food_id
  end

  def down
    remove_column :favorite_foods, :food_type_id
    remove_column :favorite_foods, :food_category_id
    add_column :favorite_foods, :food_category, :string
    add_column :favorite_foods, :food_type, :string
    add_column :favorite_foods, :food_id, :integer
  end
end
