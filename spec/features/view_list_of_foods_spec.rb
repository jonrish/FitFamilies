require 'spec_helper'

feature 'user views a list of foods', %q{as a child or parent
  i want to be able to view a list of foods
  so that i can pick what to eat.
} do

# AC
# 1) food index page
# 2) food list should display a name, a type, and a category.
# 3) user can search food list by name
# 4) user can sort food list by category and/or type
# 5) user can limit number of food list items displayed
  
  before(:each) do
    fc = FactoryGirl.create(:food_category) 
    ft = FactoryGirl.create(:food_type)
    FactoryGirl.create(:food, food_category_id: fc.id, food_type_id: ft.id)
  end

  scenario 'user explores list of foods' do
    visit foods_path
    expect(page).to have_content 'Yogurt'
    expect(page).to have_content 'Dairy'
    expect(page).to have_content 'Breakfast'
  end
end