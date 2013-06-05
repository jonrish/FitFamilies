class CreateFamilyAccounts < ActiveRecord::Migration
  def change
    create_table :family_accounts do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :zip_code

      t.timestamps
    end
  end
end
