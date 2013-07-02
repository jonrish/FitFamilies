require 'spec_helper'

feature 'a user is able to delete favorite activities', %q{
	As a user 
	I want to be able to delete items from my favorite activity list
	so that only items I want are on my list
} do

# AC
# 1) user can delete an item from the show page or the index page
# 2) user is notified if item is successfully deleted
# 3) user is redirected to favorite activities index page

	let!(:favorite_activity) { FactoryGirl.create(:favorite_activity) }

	scenario 'user deletes an activity from the index page' do
		sign_in_as(favorite_activity.child_account.family_account)
		counter = favorite_activity.child_account.favorite_activities.count
		visit child_account_favorite_activities_path(favorite_activity.child_account)
		click_on 'Remove'
		expect(page).to have_content 'The activity has been removed from your favorites'
		expect(current_path).to eql(child_account_favorite_activities_path(favorite_activity.child_account))
		expect(favorite_activity.child_account.favorite_activities.count).to eql(counter - 1)
	end

	scenario 'user delates and actiity from the show page' do
		sign_in_as(favorite_activity.child_account.family_account)
		counter = favorite_activity.child_account.favorite_activities.count
		visit child_account_favorite_activity_path(favorite_activity.child_account, favorite_activity)
		click_on 'Remove'
		expect(page).to have_content 'The activity has been removed from your favorites'
		expect(current_path).to eql(child_account_favorite_activities_path(favorite_activity.child_account))
		expect(favorite_activity.child_account.favorite_activities.count).to eql(counter - 1)
	end

end
