require 'spec_helper'

feature 'remove a favorite food', %q{
  as a user 
  i want to be able to remove foods from my favorites list so that
  I can keep my list of favorites up to date.
} do

# AC
# 1) a signed in user can remove a food from their list of favorites 
# (favorite food index page)
# 2) a user can also remove a favorite food from the edit page.
# 3) if food is removed user is notified and redirected to favorite 
# foods list (index)

  let!(:favorite_food) { FactoryGirl.create(:favorite_food) }

  scenario 'a signed in user removes a favorite food from favorites list' do
    count = FavoriteFood.all.count
    sign_in_as(favorite_food.child_account.family_account)
    visit child_account_favorite_foods_path(favorite_food.child_account)
    click_on 'Remove'
    expect(FavoriteFood.all.count).to eql(count - 1)
    expect(page).to have_content 'Your food has been removed from your list of favorites.'
    expect(current_path).to eql(child_account_favorite_foods_path(favorite_food.child_account))
  end

  scenario 'a signed in user removes a favorite food from edit page' do
    count = FavoriteFood.all.count
    sign_in_as(favorite_food.child_account.family_account)
    visit edit_child_account_favorite_food_path(favorite_food.child_account, favorite_food)
    click_on 'Remove'
    expect(FavoriteFood.all.count).to eql(count - 1)
    expect(page).to have_content 'Your food has been removed from your list of favorites.'
    expect(current_path).to eql(child_account_favorite_foods_path(favorite_food.child_account))
  end
end
