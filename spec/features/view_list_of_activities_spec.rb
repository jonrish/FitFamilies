require 'spec_helper'

feature 'view list of activities', %q{
  as a parent or child
  i want to be able to view a list of activities
  so that I can choose activities that interest me.  
} do

# AC
# 1) view list from activity index page
# 2) be able to search list by name
# 3) be able to sort list by category
# 4) user is able to limit number of activities displayed
# 5) any user may view activity list

  let!(:activity) { FactoryGirl.create(:activity) }

  scenario 'user views a list of activities' do
    visit activities_path
    expect(page).to have_content activity.name
    expect(page).to have_content activity.activity_category.activity_category
    expect(page).to have_content activity.description
  end

  scenario 'user searches list by name' do
  end

end

