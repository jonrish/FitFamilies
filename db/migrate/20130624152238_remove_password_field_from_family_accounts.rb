class RemovePasswordFieldFromFamilyAccounts < ActiveRecord::Migration
  def up
    remove_column :family_accounts, :password
  end

  def down
    add_column :family_accounts, :password, :string
  end
end
