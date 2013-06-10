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
    date_of_birth '2013-06-10'
    gender '0'
  end

  factory :food do
    name 'peanut butter'
  end

  factory :food_category do
    food_category 'Lunch'
  end

  factory :food_type do
    food_type 'Carbs (like Bread & Pasta)'
  end
end