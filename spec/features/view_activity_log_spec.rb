require 'spec_helper'

feature 'view activity log', %q{
	as a child or parent
	I want to be able to see a list (or log) of activities i've marked as having participated in
	so that i can keep track of what i've done
} do

# AC 
# 1) view from activity log index page
# 2) user is able to see date added, name, category & description
# 3) user is able to sort by date
# 4) user may search by name or description
# 5) user may filter by category
# 6) user can limit number of entries displayed
# 7) user can access the log index page from the favorite activities page & child show page

	let(:activity_log) { FactoryGirl.create(:activity_log) }

	scenario 'user visits their activity log' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		expect(page).to have_content 'Here is what you\'ve done'
		expect(page).to have_content activity_log.name
		expect(page).to have_content activity_log.activity_category.activity_category
		expect(page).to have_content activity_log.date
		expect(page).to have_content activity_log.description
	end
end
