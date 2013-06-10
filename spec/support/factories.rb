FactoryGirl.define do
  factory :family_account do
    email 'testtest@test.com'
    password 'testtest'
    first_name 'test'
    last_name 'test'
    zip_code 'test123'
    date_of_birth Date.today
  end

  factory :child_account do
    username 'test'
  end

  factory :food do
    name 'peanut butter'
  end

  factory :food_category do
    food_category 'protein'
  end

  factory :food_type do
    food_type 'breakfast'
  end
end