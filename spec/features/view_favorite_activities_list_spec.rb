require 'spec_helper'

feature 'view favorite activity list', %q{
  as a parent or child
i want to be able to see my favorite activity list
so i can view and edit the activities i've chosen
} do

# AC
# 1) view list from favorite activity index page
# 2) user can search list by name
# 3) user can filter list by activity and rating
# 4) user can sort list by name or rating
# 5) user can limit numer of activities displayed
# 6) user must be signed in 
# 7) user may click from child show page
# 8) user may click from activity index page
# 9) displays name, category & rating

  #TODO test user notified if not food added 

  let!(:favorite_activity_1) { FactoryGirl.create(:favorite_activity, rating: '1') }
  let!(:favorite_activity_2) { FactoryGirl.create(:favorite_activity, 
    child_account: favorite_activity_1.child_account) }

  scenario 'user views their favorite activity list' do
    sign_in_as(favorite_activity_1.child_account.family_account)
    visit child_account_favorite_activities_path(favorite_activity_1.child_account)
    expect(page).to have_content favorite_activity_1.name
    expect(page).to have_content favorite_activity_1.activity_category.activity_category
    expect(page).to have_content favorite_activity_1.rating
    expect(page).to have_content favorite_activity_2.name
    expect(page).to have_content favorite_activity_2.activity_category.activity_category
    expect(page).to have_content favorite_activity_2.rating
  end 

  scenario 'user navigates to favorite activity list' do
    sign_in_as(favorite_activity_1.child_account.family_account)
    visit activities_path
    click_on "Check Out #{favorite_activity_1.child_account.username}'s Favorites"
    expect(current_path).to eql(child_account_favorite_activities_path(favorite_activity_1.child_account))
    visit family_account_child_account_path(favorite_activity_1.child_account.family_account,
      favorite_activity_1.child_account)
    click_on 'Your Favorite Activities'
    expect(current_path).to eql(child_account_favorite_activities_path(favorite_activity_1.child_account))
  end

  scenario 'user searches favorite activity list by name' do
    sign_in_as(favorite_activity_1.child_account.family_account)
    visit child_account_favorite_activities_path(favorite_activity_1.child_account)
    fill_in 'Search by Name', with: favorite_activity_1.name
    click_on 'Submit'
    expect(page).to have_content favorite_activity_1.name
    expect(page).to_not have_content favorite_activity_2.name
  end

  scenario 'user can filter list by category' do
    sign_in_as(favorite_activity_1.child_account.family_account)
    visit child_account_favorite_activities_path(favorite_activity_1.child_account)
    select favorite_activity_1.activity_category.activity_category, from: 'Filter by Category'
    click_on 'Submit'
    expect(page).to have_content favorite_activity_1.name
    expect(page).to_not have_content favorite_activity_2.name
  end

  scenario 'user can filter list by rating' do
    sign_in_as(favorite_activity_1.child_account.family_account)
    visit child_account_favorite_activities_path(favorite_activity_1.child_account)
    select favorite_activity_2.rating, from: 'Filter by Rating'
    click_on 'Submit'
    expect(page).to have_content favorite_activity_2.name
    expect(page).to_not have_content favorite_activity_1.name
  end

  scenario 'user clears search form' do
    sign_in_as(favorite_activity_1.child_account.family_account)
    visit child_account_favorite_activities_path(favorite_activity_1.child_account)
    select favorite_activity_2.rating, from: 'Filter by Rating'
    click_on 'Submit'
    click_on 'Clear Search'
    expect(page).to have_content favorite_activity_1.name
    expect(page).to have_content favorite_activity_2.name
  end 

  scenario 'user sorts list by name' do
    sign_in_as(favorite_activity_1.child_account.family_account)
    visit child_account_favorite_activities_path(favorite_activity_1.child_account)
    within("#favorite_activities_table") do
      click_on 'Activity Name'
      (favorite_activity_1.name).should appear_before(favorite_activity_2.name) 
    end
    within("#favorite_activities_table") do 
      click_on 'Activity Name'
      (favorite_activity_2.name).should appear_before(favorite_activity_1.name) 
    end
  end

  scenario 'user sorts list by rating' do
    sign_in_as(favorite_activity_1.child_account.family_account)
    visit child_account_favorite_activities_path(favorite_activity_1.child_account)
    within("#favorite_activities_table") do
      click_on 'Rating'
      (favorite_activity_1.name).should appear_before(favorite_activity_2.name)
    end
    within("#favorite_activities_table") do
      click_on 'Rating'
      (favorite_activity_2.name).should appear_before(favorite_activity_1.name)
    end
  end
end
