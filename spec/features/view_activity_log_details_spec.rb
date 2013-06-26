require 'spec_helper'

feature 'view activity log details', %q{
	As a user
	I want to view all of the details of my logged activity
	so I can see the specifics of what I completed
} do

# AC
# 1) access details from the activity log index page
# 2) user views name, category, description, note, time, weight, sets & repetitions
# 3) user can navigate back to favorite activities list or activity list

	let(:activity_log) { FactoryGirl.create(:activity_log) }

	scenario 'user views details of a specific activity log entry' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		click_on activity_log.name
		expect(current_path).to eql(child_account_activity_log_path(activity_log.child_account, activity_log))
		expect(page).to have_content activity_log.name
		expect(page).to have_content activity_log.activity_category.activity_category
		expect(page).to have_content activity_log.date
		expect(page).to have_content activity_log.description
		expect(page).to have_content activity_log.note
		expect(page).to have_content activity_log.time
		expect(page).to have_content activity_log.weight
		expect(page).to have_content activity_log.sets
		expect(page).to have_content activity_log.repetitions
		expect(page).to have_content 'Here are the details of your log entry'
	end

	scenario 'user navigates off the activity log show page' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_log_path(activity_log.child_account, activity_log)
		click_on 'Back to My Activity Log'
		expect(current_path).to eql(child_account_activity_logs_path(activity_log.child_account))
	end
end
