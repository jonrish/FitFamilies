require 'spec_helper'

feature 'edit favorite food details', %q{
  as a user 
  i want to be able to change my favorite food details 
  so that I can make changes, additions and corrections
} do

# AC
# 1) edit favorite food from edit favorite foods page
# 2) link to edit page from favorite foods index page
# 3) link to edit page from favorite foods show page
# 4) notify user if successfully updated or not
# 5) if successful redirect to favorite foods show page
# 6) if not successful remain on edit page
# 7) add cancel/ back button/link
# 8) i can specify a custom category and/or type in addition to the default value

  let(:favorite_food) { FactoryGirl.create(:favorite_food) }

  scenario 'user changes details of favorite food' do
    sign_in_as(favorite_food.child_account.family_account)
    visit child_account_favorite_food_path(favorite_food.child_account_id,favorite_food)
    click_on 'Edit My Favorite Food'
    fill_in 'What is your food called?', with: 'Jelly'
    click_on 'Submit'
    expect(page).to have_content 'Jelly'
    expect(current_path).to eql(child_account_favorite_food_path(favorite_food.child_account, favorite_food))
    expect(page).to have_content 'Your favorite has been updated'
  end

  scenario 'user able to access edit favorite food from index page' do
    sign_in_as(favorite_food.child_account.family_account)
    visit child_account_favorite_foods_path(favorite_food.child_account)
    click_on 'Edit My Food'
    expect(current_path).to eql(edit_child_account_favorite_food_path(favorite_food.child_account, favorite_food))
    expect(page).to have_content 'What would you like to change?'
  end

  scenario 'user can go backto list without makiung chnages' do
    sign_in_as(favorite_food.child_account.family_account)
    visit edit_child_account_favorite_food_path(favorite_food.child_account, favorite_food)
    click_on 'Cancel / Back to My Favorite Foods'
    expect(current_path).to eql(child_account_favorite_foods_path(favorite_food.child_account))
  end
end
