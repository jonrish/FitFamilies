class RemoveFamilyAccountPassword < ActiveRecord::Migration
  def up
    remove_column :family_accounts, :password
  end

  def down
  end
end
