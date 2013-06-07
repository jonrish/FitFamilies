class CreateFamilyAccounts < ActiveRecord::Migration
  def change
    create_table :family_accounts do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.string :zip_code, null: false

      t.timestamps
    end
  end
end
