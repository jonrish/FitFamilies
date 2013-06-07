class CreateChildAccounts < ActiveRecord::Migration
  def change
    create_table :child_accounts do |t|
      t.string :username, null: false
      t.string :gender, null: false
      t.date :date_of_birth, null: false
      t.integer :family_account_id, null: false

      t.timestamps
    end
  end
end
