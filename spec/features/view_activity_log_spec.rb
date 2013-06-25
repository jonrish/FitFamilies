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
# 7) user can access the log index page from the favorite activities 
	# page & child show page
# 8) user can navigate to activities index or favorite activites index

	let(:child_account) {FactoryGirl.create(:child_account) }

	scenario 'user notified if no items exist in their log' do
		sign_in_as(child_account.family_account)
		visit child_account_activity_logs_path(child_account)
		expect(page).to have_content 'You haven\'t logged any activities yet'
	end

	let(:activity_log) { FactoryGirl.create(:activity_log, date: Date.tomorrow) }
	let!(:activity_log_2) { FactoryGirl.create(:activity_log, child_account: activity_log.child_account) }

	scenario 'user visits their activity log' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		expect(page).to have_content 'Here is what you\'ve done'
		expect(page).to have_content activity_log.name
		expect(page).to have_content activity_log.activity_category.activity_category
		expect(page).to have_content activity_log.date
		expect(page).to have_content activity_log.description
	end

	scenario 'user navigates to activity log index' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_favorite_activities_path(activity_log.child_account)
		click_on 'My Activity Log'
		expect(current_path).to eql(child_account_activity_logs_path(activity_log.child_account))
		visit family_account_child_account_path(activity_log.child_account.family_account, activity_log.child_account)
		click_on 'Your Activity Log'
		expect(current_path).to eql(child_account_activity_logs_path(activity_log.child_account))
		visit activities_path
		click_on "Check Out #{activity_log.child_account.username}'s Activity Log"
		expect(current_path).to eql(child_account_activity_logs_path(activity_log.child_account))
	end

	scenario 'user navigates from activity log index page' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		click_on 'Back to Your Favorite Activities'
		expect(current_path).to eql(child_account_favorite_activities_path(activity_log.child_account))
		visit child_account_activity_logs_path(activity_log.child_account)
		click_on 'Back to the Activity List'
		expect(current_path).to eql(activities_path)
	end

	scenario 'user searches activity log by name' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		fill_in 'Search by Name', with: activity_log.name
		click_on 'Submit'
		expect(page).to have_content activity_log.name
		expect(page).to_not have_content activity_log_2.name
		fill_in 'Search by Name', with: activity_log_2.name
		click_on 'Submit'
		expect(page).to have_content activity_log_2.name
		expect(page).to_not have_content activity_log.name
	end

	scenario 'user searches activity log by description' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		fill_in 'Search by Description', with: activity_log.description
		click_on 'Submit'
		expect(page).to have_content activity_log.description
		expect(page).to_not have_content activity_log_2.description
		fill_in 'Search by Description', with: activity_log_2.description
		click_on 'Submit'
		expect(page).to have_content activity_log_2.description
		expect(page).to_not have_content activity_log.description
	end

	scenario 'user filters by category' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		select activity_log.activity_category.activity_category, from: 'Filter by Category'
		click_on 'Submit'
		within("#activity_log_table") do
			expect(page).to have_content activity_log.activity_category.activity_category
			expect(page).to_not have_content activity_log_2.activity_category.activity_category
		end
		select activity_log_2.activity_category.activity_category, from: 'Filter by Category'
		click_on 'Submit'
		within("#activity_log_table") do
			expect(page).to_not have_content activity_log.activity_category.activity_category
			expect(page).to have_content activity_log_2.activity_category.activity_category
		end
	end

	scenario 'user clears search & filter form' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		fill_in 'Search by Description', with: activity_log.description
		click_on 'Submit'
		click_on 'Clear Search'
		expect(page).to have_content activity_log.name
		expect(page).to have_content activity_log_2.name
	end

	scenario 'users sorts date' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		click_on 'Date Added'
		within("#activity_log_table") do
			(activity_log_2.name).should appear_before(activity_log.name)
		end
		click_on 'Date Added'
		within("#activity_log_table") do
			(activity_log.name).should appear_before(activity_log_2.name)
		end
	end

	scenario 'user filters activity log by date' do
		sign_in_as(activity_log.child_account.family_account)
		visit child_account_activity_logs_path(activity_log.child_account)
		select activity_log.date.year, from: 'q[date_eq(1i)]'
		select I18n.t("date.month_names")[activity_log_2.date.month], from: 'q[date_eq(2i)]'
		select activity_log.date.day, from: 'q[date_eq(3i)]' 
		click_on 'Submit'
		within("#activity_log_table") do
			expect(page).to have_content activity_log.name
			expect(page).to_not have_content activity_log_2.name
		end
		select activity_log_2.date.year, from: 'q[date_eq(1i)]'
		select I18n.t("date.month_names")[activity_log_2.date.month], from: 'q[date_eq(2i)]'
		select activity_log_2.date.day, from: 'q[date_eq(3i)]' 
		click_on 'Submit'
		within("#activity_log_table") do
			expect(page).to_not have_content activity_log.name
			expect(page).to have_content activity_log_2.name
		end
	end
end
