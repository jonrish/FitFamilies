FactoryGirl.define do
  factory :family_account do
    email 'test@test.com'
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
    name 'Yogurt'
  end

  factory :food_category do
    food_category 'Breakfast'
  end

  factory :food_type do
    food_type 'Milk & Dairy'
  end
end