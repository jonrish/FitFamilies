require 'spec_helper'

feature 'user views a list of foods', %q{as a child or parent
  i want to be able to view a list of foods
  so that i can pick what to eat.
} do

# AC
# 1) display on food index page
# 2) food list should display a name, a type, and a category.
# 3) user can search food list by name
# 4) user can sort food list by category and/or type
# 5) user can limit number of food list items displayed
  
  let(:category) { FactoryGirl.create(:food_category) }
  let(:type) { FactoryGirl.create(:food_type) }
  let!(:food) { FactoryGirl.create(:food, food_category: category, food_type: type) }

  scenario 'user explores list of foods' do
    visit foods_path
    expect(page).to have_content food.name
    expect(page).to have_content category.food_category
    expect(page).to have_content type.food_type
  end
end