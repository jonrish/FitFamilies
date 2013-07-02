require 'spec_helper'

feature 'view favorite activity details', %q{
	as a user
	I want to be able to view individual favorite activity details
	so that i can view specific information about my favorite activities
} do

# AC
# 1) view on favorite activity show page
# 2) should display name, description, activity category, rating, note
# 3) navigate from favorite activity index page
# 4) navigate back to favorite activity index page
# 5) user must be signed in 

	let!(:favorite_activity) { FactoryGirl.create(:favorite_activity)}

	scenario 'user moves to and from favorite activity details page' do
		sign_in_as(favorite_activity.child_account.family_account)
		visit child_account_favorite_activities_path(favorite_activity.child_account)
		click_on favorite_activity.name
		expect(current_path).to eql(child_account_favorite_activity_path(favorite_activity.child_account, favorite_activity))
		click_on "Back to #{favorite_activity.child_account.username}'s Favs"
		expect(current_path).to eql(child_account_favorite_activities_path(favorite_activity.child_account))
	end

	scenario 'user views favorite activity details' do
		sign_in_as(favorite_activity.child_account.family_account)
		visit child_account_favorite_activity_path(favorite_activity.child_account, favorite_activity)
		expect(page).to have_content favorite_activity.name
		expect(page).to have_content favorite_activity.activity_category.activity_category
		expect(page).to have_content favorite_activity.rating
		expect(page).to have_content favorite_activity.description
		expect(page).to have_content favorite_activity.note
	end
end
