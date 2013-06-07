FactoryGirl.define do
  factory :family_account do
    email 'testtest@test.com'
    password 'testtest'
    first_name 'test'
    last_name 'test'
    zip_code 'test123'
    date_of_birth Date.today
  end
end