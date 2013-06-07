class ChildAccount < ActiveRecord::Base
  validates_presence_of :date_of_birth
  validates_presence_of :family_account_id
  validates_presence_of :gender
  validates_presence_of :username

  belongs_to :family_account, :inverse_of => :child_accounts

  attr_accessible :date_of_birth, :family_account_id, :gender, :username
end
