require 'spec_helper'

feature 'user edits activity log entries', %q{
	as a child or parent
	i want to be able to change the info of activities on my activity log
	so i can update info and correct mistakes
	} do

# AC
# 1) from the activity log index page or show page a user can click on the activity 
# 	and edit the entry on the activity log edit page
# 2) user can change or add to notes, sets, repetitions, weight and time fields
# 3) user is notified if the entry has been updated or deleted and redirected 
# 	to the activity log index page
# 4) user is prompted to try again if not successfully updated
# 5) user may also navigate back to activity log index or show page without making changes

	let(:activity_log) { FactoryGirl.create(:activity_log)}
	let!(:activity_category) { FactoryGirl.create(:activity_category) }

	scenario 'user edits individual activity log entry' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		click_on 'Edit'
		expect(current_path).to eql(edit_child_account_activity_log_path(activity_log.child_account,activity_log))
		fill_in 'Name', with: 'Jogging'
		select activity_category.activity_category, from: 'Category'
		fill_in 'Description', with: 'aim for a nice steady pace'
		select 'May', from: 'activity_log[date(2i)]'
		select '1', from: 'activity_log[date(3i)]'		
		select '2012', from: 'activity_log[date(1i)]'
		select '10', from: 'Duration in minutes'
		select '1', from: 'Weight'
		select '1', from: 'Sets'
		select '1', from: 'Repetitions'
		fill_in 'Notes', with: 'everyone should try this out'
		click_on 'Submit'
		expect(current_path).to eql(child_account_activity_logs_path(activity_log.child_account))
		expect(page).to have_content 'Your activity log entry has been updated'
	end

	scenario 'user prompted to try again if not updated' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		click_on 'Edit'
		fill_in 'Name', with: ''
		expect(current_path).to eql(edit_child_account_activity_log_path(activity_log.child_account,activity_log))
	end

	scenario 'user navigates from edit acitivity log entry page to index' do
		sign_in_as(activity_log.child_account.family_account)
		visit edit_child_account_activity_log_path(activity_log.child_account, activity_log)
		click_on "Cancel / Back to #{activity_log.child_account.username}'s Activity Log"
		expect(current_path).to eql(child_account_activity_logs_path(activity_log.child_account))
	end

	scenario 'user navigates from edit activity log to activity log show page' do
		sign_in_as(activity_log.child_account.family_account)
		visit edit_child_account_activity_log_path(activity_log.child_account, activity_log)
		click_on 'Cancel / Back to Activity'
		expect(current_path).to eql(child_account_activity_log_path(activity_log.child_account, activity_log))
	end

end
