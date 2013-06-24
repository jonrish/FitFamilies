class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.string :name, null: false
      t.string :description
      t.text :note
      t.integer :rating
      t.time :time
      t.integer :weight
      t.integer :sets
      t.integer :repetitions
      t.integer :activity_category_id, null: false
      t.integer :child_account_id, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
