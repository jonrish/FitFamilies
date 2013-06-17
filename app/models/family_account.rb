class FamilyAccount < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :date_of_birth
  validates_presence_of :zip_code

  validates_length_of :zip_code, minimum: 5, message: "Your entry was too short. Please enter at least five characters."
  has_many :child_accounts, :inverse_of => :family_account, :dependent => :destroy

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :date_of_birth, :zip_code
  
end
