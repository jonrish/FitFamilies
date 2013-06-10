class FamilyAccount < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :date_of_birth
  validates_presence_of :zip_code

  validates_format_of :email, with: /\b[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}\b/i, :message => "Please enter a valid email address."
  validates_uniqueness_of :email, message: "That email is already in use. Please select another email address."
  validates_length_of :zip_code, minimum: 5, message: "Your entry was too short. Please enter at least five characters."


  has_many :child_accounts, :inverse_of => :family_account, :dependent => :destroy


  attr_accessible :email, :password, :first_name, :last_name, :date_of_birth, :zip_code
end
