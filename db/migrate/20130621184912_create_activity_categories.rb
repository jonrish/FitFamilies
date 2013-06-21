class CreateActivityCategories < ActiveRecord::Migration
  def change
    create_table :activity_categories do |t|
      t.string :activity_category, null: false

      t.timestamps
    end
  end
end
