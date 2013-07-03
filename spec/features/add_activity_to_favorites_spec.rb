require 'spec_helper'

feature 'user adds activity to favorite activity list', %q{
	as a child or parent 
	I want to be able to add selected activities to my favorite activity list
	so i can keep track of the activities i'm most interested in
} do

# AC
# 1) user can add activity to favorites list from the index page
# 2) user should be notified that the activity was successfully added
# 3) user is redirected to favorite activities index page
# 4) user must be signed in
# 5) non-signed in user redirected to sign in page when clicking on add to favorites

	let!(:child_account) { FactoryGirl.create(:child_account) }
	let!(:activity) { FactoryGirl.create(:activity) }

	scenario 'user adds an activity to favorites from activy index page' do
		sign_in_as(child_account.family_account)
		counter = child_account.favorite_activities.count
		visit activities_path
		click_button "#{child_account.username}'s Favs"
		expect(page).to have_content 'The activity has been added to your favorites'
		expect(current_path).to eql(child_account_favorite_activities_path(child_account))
		expect(child_account.favorite_activities.count).to eql(counter + 1)
	end

	scenario 'non-signed in user clicks add to favorites' do
		visit activities_path
		counter = child_account.favorite_activities.count
		click_on 'Add to Favorites'
		expect(current_path).to eql(new_family_account_session_path)
		expect(child_account.favorite_activities.count).to eql(counter)
	end

end
