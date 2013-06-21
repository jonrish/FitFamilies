FactoryGirl.define do
  factory :family_account do
    sequence(:email) {|n| "test#{n}@test.com" }
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
    family_account
  end

  factory :food do
    name 'Peanut Butter'
    food_type
    food_category
  end

  factory :food_category do
    food_category 'Breakfast'
  end

  factory :food_type do
    food_type 'Protein (like Meat, Fish & Beans)'
  end

  factory :favorite_food do
    sequence(:name) { |n| "Peanut Butter#{n}" }
    note 'The best food ever!!!'
    rating '5'
    share_with_others 'true'
    food_type
    food_category
    child_account
  end
end
