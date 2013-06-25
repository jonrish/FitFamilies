require 'spec_helper'

feature 'user views activity details', %q{
  as a parent or child
  I want to view activities individually
  so that i can find out more about the
} do

# AC
# 1) individual activities are viewed on activity show page
# 2) displays name, description and category
# 3) user clicks link from activity index page

  let!(:activity) { FactoryGirl.create(:activity) }

  scenario 'user views activity details' do
    visit activities_path
    click_on activity.name
    expect(page).to have_content activity.name
    expect(page).to have_content activity.description
    expect(page).to have_content activity.activity_category.activity_category
    expect(current_path).to eql(activity_path(activity))
  end
end
