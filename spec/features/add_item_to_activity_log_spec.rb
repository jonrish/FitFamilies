require 'spec_helper'

feature 'user adds item to activity log', %q{
	as a parent or child
	I want to be able to add favorite activities to my activity log
	so i can keep track of what i've done
} do

# AC
# 1) user can click a button from the favorite activity index page to add to their log
# 2) item is automatically added with existing info
# 3) user is notified if the item has been successfully added to the log
# 4) user is redirected to the activity log index page

	let(:favorite_activity) { FactoryGirl.create(:favorite_activity) }

	scenario 'user adds favorite activity to their activity log' do
		sign_in_as(favorite_activity.child_account.family_account)
		counter = favorite_activity.child_account.activity_logs.count
		visit child_account_favorite_activities_path(favorite_activity.child_account)
		click_on "#{favorite_activity.child_account.username}'s Log"
		expect(current_path).to eql(child_account_activity_logs_path(favorite_activity.child_account))
		expect(favorite_activity.child_account.activity_logs.count).to eql(counter + 1)
		expect(page).to have_content 'The activity has been added to your log'
	end

end
