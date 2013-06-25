require 'spec_helper'

feature 'user deletes_activity_log_entry', %q{
	As a user
I want to be able to delete activity log entries
so i can correct mistakes & remove unwanted entries
} do

# 1) user may choose to delete entry from activity log index page or show page
# 2) user is notified if entry successfully deleted
# 3) user is redirected to activity log index page

	let(:activity_log) { FactoryGirl.create(:activity_log) }

	scenario 'user deletes an activity log entry from the activity log index' do
		sign_in_as(activity_log.child_account.family_account)
		counter = activity_log.child_account.activity_logs.count
		visit child_account_activity_logs_path(activity_log.child_account)
		click_on 'Remove from Log'
		expect(activity_log.child_account.activity_logs.count).to eql(counter - 1)
		expect(current_path).to eql(child_account_activity_logs_path(activity_log.child_account))
		expect(page).to have_content 'The log entry has been removed'
	end

	scenario 'user deletes an activity log entry from the activity log show page' do
		sign_in_as(activity_log.child_account.family_account)
		counter = activity_log.child_account.activity_logs.count
		visit child_account_activity_log_path(activity_log.child_account, activity_log)
		click_on 'Remove from Log'
		expect(activity_log.child_account.activity_logs.count).to eql(counter - 1)
		expect(current_path).to eql(child_account_activity_logs_path(activity_log.child_account))
		expect(page).to have_content 'The log entry has been removed'
	end

end
