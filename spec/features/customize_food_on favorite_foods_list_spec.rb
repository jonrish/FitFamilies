require 'spec_helper'

feature 'customize favorite foods', %q{
  as a parent or child 
i want to customize food that i've added to my favorites list
so i can personalize and add info
} do

# AC
# 1) user can click on an edit link from the favorites foods index page. 
# 2) on edit page a user can add or change a custom category, type, note and rating
# 3) user is notified if info has been updated successfully
# 4) user is redirected to the favorite food index page

  let!(:food) { FactoryGirl.create(:food) }
  let(:child_account) {FactoryGirl.create(:child_account) }

  scenario 'user is able to edit favorite foods that were added from the database' do
    sign_in_as(child_account.family_account)
    counter = child_account.favorite_foods.count
    visit foods_path
    click_on "Add to #{child_account.username}'s Favorites"
    expect(child_account.favorite_foods.count).to eql(counter + 1)
    click_on 'Edit My Food'
    fill_in 'What is your food called?', with: 'Jelly'
    choose 'favorite_food_share_with_others_true'
    choose 'favorite_food_rating_5'
    fill_in 'note', with: 'Strawberry is my favorite. But Grape is ok too.'
    click_on 'Submit'
    expect(current_path).to eql(child_account_favorite_foods_path(child_account))
    expect(page).to have_content 'Jelly'
    expect(child_account.favorite_foods.count).to eql(counter + 1)
    expect(page).to have_content 'Your favorite has been updated'
  end

end

