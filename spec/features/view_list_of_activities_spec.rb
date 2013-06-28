require 'spec_helper'

feature 'view list of activities', %q{
  as a parent or child
  i want to be able to view a list of activities
  so that I can choose activities that interest me.  
} do

# AC
# 1) view list from activity index page
# 2) be able to search list by name and description
# 3) user is able to limit number of activities displayed
# 4) any user may view activity list

  let!(:activity_1) { FactoryGirl.create(:activity) }
  let!(:activity_2) { FactoryGirl.create(:activity) }
  let!(:activity_3) { FactoryGirl.create(:activity) }

  scenario 'user views a list of activities' do
    visit activities_path
    expect(page).to have_content activity_1.name
    expect(page).to have_content activity_1.activity_category.activity_category
    expect(page).to have_content activity_1.description
  end

  scenario 'user searches list by name' do
    visit activities_path
    fill_in 'Search by Name', with: activity_1.name
    click_on 'Submit'
    within('#activity_table') do
      expect(page).to have_content activity_1.name
      expect(page).to have_content activity_1.activity_category.activity_category
      expect(page).to have_content activity_1.description
      expect(page).to_not have_content activity_2.name
      expect(page).to_not have_content activity_2.activity_category.activity_category
      expect(page).to_not have_content activity_2.description
    end
  end

  scenario 'user searches list by description' do
    visit activities_path
    fill_in 'Search by Description', with: activity_2.description
    click_on 'Submit'
    within('#activity_table') do
      expect(page).to have_content activity_2.name
      expect(page).to have_content activity_2.activity_category.activity_category
      expect(page).to have_content activity_2.description
      expect(page).to_not have_content activity_1.name
      expect(page).to_not have_content activity_1.activity_category.activity_category
      expect(page).to_not have_content activity_1.description
    end 
  end

  scenario 'user filters list by category' do
    visit activities_path
    select activity_2.activity_category.activity_category, from: 'Filter by Category'
    click_on 'Submit'
    within('#activity_table') do
      expect(page).to have_content activity_2.name
      expect(page).to have_content activity_2.activity_category.activity_category
      expect(page).to have_content activity_2.description
      expect(page).to_not have_content activity_1.name
      expect(page).to_not have_content activity_1.activity_category.activity_category
      expect(page).to_not have_content activity_1.description
    end
  end

  scenario 'user may limit the number of items displayed per page' do
    visit activities_path
    50.times do
      FactoryGirl.create(:activity)
    end
    select '5', from: 'Items to Display'
    click_on 'Submit'
    within('#activity_table') do
      expect(page).to have_selector('tr', count: 5)
      expect(page).to_not have_selector('tr', count: 50)
    end
    select '50', from: 'Items to Display'
    click_on 'Submit'
    within('#activity_table') do
      expect(page).to have_selector('tr', count: 50)
      expect(page).to_not have_selector('tr', count: 5)
    end
  end
end
