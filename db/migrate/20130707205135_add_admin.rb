class AddAdmin < ActiveRecord::Migration
  def up
  	add_column :family_accounts, :admin, :boolean, default: false
  end

  def down
  	remove_column :family_accounts, :admin
  end
end
