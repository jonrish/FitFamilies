require 'spec_helper'

feature 'add food to list of favorites', %q{
  as a parent or child
  I want to be able to select an item from the food list and add 
  it to my list of favorites so that I can keep track of things i want to eat.
  } do

# AC
# 1) user is able to click a button or select a box and add a food item to
# their list of favorites
# 2) from food index page. notify if added successfully. remain on food index page. 
# 3) users can view foods without signing in
# 4) users must sign in to favorite foods
# 5) non-signed in users who click to favorite are redirected to sign-in page
# 6) users can add foods from food show page

  let(:child_account) { FactoryGirl.create(:child_account) }
  let!(:food1) { FactoryGirl.create(:food) }
  let!(:food2) { FactoryGirl.create(:food, name: 'Jelly') }

  scenario 'user selects a food from database to add to their favorites' do
    sign_in_as(child_account.family_account)
    visit foods_path

    # test not complete
  end

  scenario 'user adds a food to his favorites from food show page' do
    sign_in_as(child_account.family_account)
    visit food_path(food1)
    expect(page).to have_content food1.name
    click_on 'Add to My Favorites'
  end

end
