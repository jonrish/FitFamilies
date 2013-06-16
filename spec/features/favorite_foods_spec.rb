require 'spec_helper'

#user can view a list of favorited foods
#user can add to his favorites list from food database
#user can create custom favorite food as needed

# describe 'using a list of favorite foods' do

#   let(:fa) { FactoryGirl.create(:family_account) }
#   let(:ca) { FactoryGirl.create(:child_account, family_account_id: fa.id) }

#   it 'allows user to view a list of favorite foods' do
#     visit child_account_favorite_foods_path(ca.id)
#     expect(page).to have_content 'Here are all of your favorites!'
#   end

#   it 'allows a user to add a food to their favorites list' do
#   end

#   it 'allows a user to create their own favorite food' do
#     FactoryGirl.create(:food_type, food_type: 'Carbs (like Bread & Pasta)')
#     FactoryGirl.create(:food_category, food_category: 'Lunch')
#     visit new_child_account_favorite_food_path(ca.id)
#     fill_in 'What is your food called?', with: 'peanut butter & banana sandwich'
#     select 'Carbs (like Bread & Pasta)', from: 'What kind of food is it?'
#     select 'Lunch', from: 'When would you like to eat it?'
#     click_button 'Add to My Favorites'
#   end

#   it 'allows users to modify some aspects of favorited foods' do
#   end
# end