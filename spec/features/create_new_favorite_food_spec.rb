require 'spec_helper'

feature 'create new favorite food', %q{as a parent or child 
  I can create a new favorite food to add to my list 
  so I can add my original creations.
} do

# AC
# 1) i can specify a name, type, category, note and rating for my new favorite food
# 2) i can specify whether or not I want to share my food with other users
# 3) link to create new food from the favorite food index page.
# 4) favorite food is created from the new page.
# 5) redirect to favorite food index page is successful
# 6) user is notified whether or not successfully created
# 7) name, category, type are all required fields

  let(:child_account) { FactoryGirl.create(:child_account) }
  let!(:food_type) { FactoryGirl.create(:food_type, food_type: 'Carbs (like Bread & Pasta)') }
  let!(:food_category) { FactoryGirl.create(:food_category, food_category: 'Lunch') }

  scenario 'a user can create a new favorite food' do
    sign_in_as(child_account.family_account)
    count = FavoriteFood.count
    visit child_account_favorite_foods_path(child_account)
    click_link 'Add Your Own Favorite'
    fill_in 'What is your food called?', with: 'peanut butter & banana sandwich'
    select 'Carbs (like Bread & Pasta)', from: 'What kind of food is it?'
    select 'Lunch', from: 'When would you like to eat it?'
    choose 'favorite_food_share_with_others_false'
    choose 'favorite_food_rating_5'
    fill_in 'note', with: 'PBB is the greatest!'
    click_button 'Submit'
    expect(FavoriteFood.count).to eql(count + 1)
    expect(page).to have_content 'Your new food is now a favorite'
    expect(current_path).to eql(child_account_favorite_foods_path(child_account))
  end

  scenario 'a user chooses to share new food' do
    sign_in_as(child_account.family_account)
    count = FavoriteFood.count
    visit new_child_account_favorite_food_path(child_account)
    click_button 'Submit'
    expect(page).to have_content 'Sorry. That didn\'t work'
    expect(FavoriteFood.count).to eql(count)
    fill_in 'What is your food called?', with: 'peanut butter & banana sandwich'
    select 'Carbs (like Bread & Pasta)', from: 'What kind of food is it?'
    select 'Lunch', from: 'When would you like to eat it?'
    click_button 'Submit'
    expect(FavoriteFood.count).to eql(count + 1)
  end
end
