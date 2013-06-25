require 'spec_helper'

feature 'user creates a new favorite activity', %q{
  as a parent or child
  i want to be able to create new activities for my favorites list
  so i can add my favorites that are not listed
} do
  
# AC
# 1) user can click to create a new activity from the favorite 
# activity list index page
# 2) activity is created on the favorite activity create page
# 3) user must enter name & category
# 4) user may optionally enter a note and a rating
# 5) user is notified if activity is successfully added to
# the favorites list
# 6) user is redirected to favorite activities list
# 7) user must be signed in

  let(:child_account) { FactoryGirl.create(:child_account) }
  let!(:activity_category) { FactoryGirl.create(:activity_category) }

  scenario 'user creates a new favorite activity' do
    sign_in_as(child_account.family_account)
    counter = child_account.favorite_activities.count
    visit new_child_account_favorite_activity_path(child_account)
    fill_in 'Name', with: 'Baseball'
    select activity_category.activity_category, from: 'Category'
    fill_in 'Description', with: 'Slow, but fun'
    fill_in 'Note', with: 'Pitching & defense wins games'
    choose 'favorite_activity_rating_5'
    click_on 'Submit'
    expect(current_path).to eql(child_account_favorite_activities_path(child_account))
    expect(child_account.favorite_activities.count).to eql(counter + 1)
    expect(page).to have_content 'The activity has been added to your favorites'
  end

  scenario 'a user does not enter required information' do
    sign_in_as(child_account.family_account)
    counter = child_account.favorite_activities.count
    visit new_child_account_favorite_activity_path(child_account)
    select activity_category.activity_category, from: 'Category'
    click_on 'Submit'
    expect(child_account.favorite_activities.count).to eql(counter)
  end
end
