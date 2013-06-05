class FamilyAccount < ActiveRecord::Base
  attr_accessible :email, :password, :first_name, :last_name, :date_of_birth, :zip_code
end
