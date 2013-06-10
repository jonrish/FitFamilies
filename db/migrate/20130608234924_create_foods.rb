class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, :null => false
      t.integer :food_category_id, :null => false
      t.integer :food_type_id, :null => false

      t.timestamps
    end
  end
end
