class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :activity_category_id, null: false

      t.timestamps
    end
  end
end
