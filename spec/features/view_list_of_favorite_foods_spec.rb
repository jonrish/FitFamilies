require 'spec_helper'

feature 'view list of favorite foods', %q{as a signed in parent or child 
  I want to be able to view and customize my list of favorited foods 
  so that I can see what I like.
} do

# AC
# 1) I can view a list of all the foods I've favorited. (favorite food index page)
# 2) I can search the list by name
# 3) I can sort the list by rating
# 4) views rating along with other info
# 5) note field is not visible on the index page
# 6) must be signed in to view favorite food list
# 7) I can filter the list by rating, type and category

  let(:favorite_food) { FactoryGirl.create(:favorite_food) }
  let(:other_child_fav_food) { FactoryGirl.create(:favorite_food, name: 'Jelly') }

  scenario 'a child views their list of favorite foods' do
    sign_in_as(favorite_food.child_account.family_account)
    visit child_account_favorite_foods_path(favorite_food.child_account)
    expect(page).to have_content favorite_food.name
    expect(page).to have_content favorite_food.food_category.food_category
    expect(page).to have_content favorite_food.food_type.food_type
    expect(page).to have_content favorite_food.rating
    expect(page).to_not have_content favorite_food.note
    expect(page).to_not have_content other_child_fav_food.name
  end

  scenario 'must sign in to view favorite foods' do
    visit child_account_favorite_foods_path(favorite_food.child_account)
    expect(current_path).to eql family_account_session_path
  end

  scenario 'user can search list by name' do
    sign_in_as(favorite_food.child_account.family_account)
    visit child_account_favorite_foods_path(favorite_food.child_account)
    fill_in 'Search by Name', with: favorite_food.name
    click_on 'Submit'
    expect(page).to have_content favorite_food.name
    fill_in 'Search by Name', with: 'Jelly'
    click_on 'Submit'
    expect(page).to_not have_content favorite_food.name
    click_on 'Clear Search'
    expect(page).to_not have_content "Jelly"
  end

  scenario 'user can sort by rating' do
    sign_in_as(favorite_food.child_account.family_account)
    favorite_food2 = FactoryGirl.create(:favorite_food, rating: '1', child_account_id: favorite_food.child_account.id)
    visit child_account_favorite_foods_path(favorite_food.child_account)
    click_on 'Rating'
    (favorite_food2.name).should appear_before(favorite_food.name)
    click_on 'Rating'
    (favorite_food.name).should appear_before(favorite_food2.name)
  end

  scenario 'user can filter list by category, rating and type' do
    
  end
end
