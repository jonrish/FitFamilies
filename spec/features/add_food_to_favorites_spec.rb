require 'spec_helper'

feature 'add food to list of favorites', %q{
  as a parent or child
  I want to be able to select an item from the food list and add 
  it to my list of favorites so that I can keep track of things i want to eat.
  } do

# AC
# 1) user is able to click a button or add a food item to
# their list of favorites
# 2) from food index page. notify if added successfully. redirect to favorites. 
# 3) users can view foods without signing in
# 4) users must sign in to favorite foods
# 5) non-signed in users who click to favorite are redirected to sign-in page
# 6) users can add foods from food show page. redirect to favorites. notify

  let(:child_account) { FactoryGirl.create(:child_account) }
  let!(:food1) { FactoryGirl.create(:food) }
  let!(:food2) { FactoryGirl.create(:food, name: 'Jelly') }

  scenario 'user selects a food from database to add to their favorites' do
    sign_in_as(child_account.family_account)
    counter = child_account.favorite_foods.count
    visit foods_path
    expect(page).to have_content food1.name
    expect(page).to have_content food2.name
    within("#food_id_#{food1.id}") do
      click_on "Add to #{child_account.username}'s Favorites"
    end
    expect(child_account.favorite_foods.count).to eql(counter + 1)
    expect(current_path).to eql(child_account_favorite_foods_path(child_account))
    expect(page).to have_content 'Your food is now a favorite'
  end

  scenario 'user adds a food to his favorites from food show page' do
    sign_in_as(child_account.family_account)
    counter = child_account.favorite_foods.count
    visit food_path(food1)
    expect(page).to have_content food1.name
    click_on "Add to #{child_account.username}'s Favorites"
    expect(child_account.favorite_foods.count).to eql(counter + 1)
    expect(current_path).to eql(child_account_favorite_foods_path(child_account))
    expect(page).to have_content 'Your food is now a favorite'
  end

  scenario 'non signed-in user clicks at to favorites from food index page' do
    visit foods_path
    within("#food_id_#{food1.id}") do
      click_on 'Add to Favorites'
    end
    expect(page).to have_content 'Sign in'
    expect(current_path).to eql(new_family_account_session_path)
  end

  scenario 'non signed-in user clicks at to favorites from food show page' do
    visit food_path(food1)
    click_on 'Add to Favorites'
    expect(page).to have_content 'Sign in'
    expect(current_path).to eql(new_family_account_session_path)
  end

end
