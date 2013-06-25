require 'spec_helper'

feature 'edit favorite activity', %q{
	as a parent or child 
	I want to be able to add to or change my favorite activities
	so that I can customize them to be the way I want
} do

# AC
# 1) user can click to edit an activity from the favorite activity show page
# 2) user can click to edit an activity from the favorite activity index page
# 3) user can edit all attributes of the favorite activities: name, description, 
# 	category, note, & rating
# 4) user is notified if item updated successfully
# 5) user is redirected to favorite activities index page
# 6) user can navigate back without making changes

	let!(:favorite_activity) { FactoryGirl.create(:favorite_activity)}
	let!(:activity_category_2) {FactoryGirl.create(:activity_category)}

	scenario 'user navigates to and from edit a favorite activity from show page' do
		sign_in_as(favorite_activity.child_account.family_account)
		visit child_account_favorite_activity_path(favorite_activity.child_account, favorite_activity)
		click_on 'Edit My Activity'
		expect(current_path).to eql(edit_child_account_favorite_activity_path(favorite_activity.child_account, favorite_activity))
		click_on "Back to #{favorite_activity.child_account.username}'s Activity"
		expect(current_path).to eql(child_account_favorite_activity_path(favorite_activity.child_account, favorite_activity))
	end

	scenario 'user navigates to and from edit a favorite activity from index page' do
		sign_in_as(favorite_activity.child_account.family_account)
		visit child_account_favorite_activities_path(favorite_activity.child_account)
		click_on 'Edit My Activity'
		expect(current_path).to eql(edit_child_account_favorite_activity_path(favorite_activity.child_account, favorite_activity))
		click_on "Back to #{favorite_activity.child_account.username}'s Favorites"
		expect(current_path).to eql(child_account_favorite_activities_path(favorite_activity.child_account))
	end

	scenario 'user makes changes to their favorite activity' do
		counter = favorite_activity.child_account.favorite_activities.count
		sign_in_as(favorite_activity.child_account.family_account)
		visit edit_child_account_favorite_activity_path(favorite_activity.child_account, favorite_activity)
		expect(page).to have_content 'Here is where you can make changes'
		fill_in 'Name', with: 'Basketball'
    select activity_category_2.activity_category, from: 'Category'
    fill_in 'Description', with: 'fast-paced'
    fill_in 'Note', with: 'don\'t fall in love with the 3-pointer'
    choose 'favorite_activity_rating_4'
    click_on 'Submit'
    expect(page).to have_content 'Your activity has been updated'
    expect(current_path).to eql(child_account_favorite_activities_path(favorite_activity.child_account))
    expect(counter).to eql(favorite_activity.child_account.favorite_activities.count)
    expect(page).to have_content 'Basketball'
    expect(page).to have_content activity_category_2.activity_category
    expect(page).to have_content '4'
	end

end
