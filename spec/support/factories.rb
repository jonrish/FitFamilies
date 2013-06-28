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
    sequence(:name) { |n| "Peanut Butter#{n}" }
    food_type
    food_category
  end

  factory :food_category do
    sequence(:food_category) { |n| "Breakfast#{n}" }
  end

  factory :food_type do
    sequence(:food_type) { |n| "Protein (like Meat, Fish & Beans)#{n}" }
  end

  factory :favorite_food do
    sequence(:name) { |n| "Peanut#{n} Butter#{n}" }
    note 'The best food ever!!!'
    rating '5'
    share_with_others 'true'
    food_type
    food_category
    child_account
  end

  factory :activity do
    sequence(:name) { |n| "Soccer#{n}" }
    sequence(:description) { |n| "Fun to play with friends#{n}" }
    activity_category
  end

  factory :activity_category do
    sequence(:activity_category) { |n| "Team Sport#{n}" }
  end

  factory :favorite_activity do
    sequence(:name) { |n| "Soccer#{n}" }
    sequence(:description) { |n| "Fun to play with friends#{n}" }
    rating '5'
    note 'You need to be in good shape to play well'
    activity_category
    child_account
  end

  factory :activity_log do
    sequence(:name) { |n| "Walking#{n}" }
    sequence(:description) { |n| "Easy to do & good for you too#{n}"}
    rating '5'
    note 'more fun to do with friends'
    time '15:00'
    weight '10'
    sets '3'
    repetitions '20'
    date Date.today
    activity_category
    child_account
  end

end
