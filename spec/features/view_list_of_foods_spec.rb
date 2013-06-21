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
  
  let!(:food1) { FactoryGirl.create(:food) }
  let!(:food2) { FactoryGirl.create(:food) }
  let!(:food3) { FactoryGirl.create(:food) }

  scenario 'user explores list of foods' do
    visit foods_path
    expect(page).to have_content food1.name
    expect(page).to have_content food1.food_category.food_category
    expect(page).to have_content food1.food_type.food_type
  end

  scenario 'user searches food by name' do
    visit foods_path
    fill_in 'Search by Name', with: food1.name
    click_on 'Submit'
    expect(page).to have_content food1.name
    expect(page).to_not have_content food2.name
    expect(page).to_not have_content food3.name
  end

  scenario 'user filters food by type and category' do
    visit foods_path
    select food2.food_type.food_type, from: "Filter by Food Type"
    click_on 'Submit'
    within("#food_table") do 
      expect(page).to have_content food2.name
      expect(page).to have_content food2.food_category.food_category
      expect(page).to have_content food2.food_type.food_type
    end
    within("#food_table") do 
      expect(page).to_not have_content food1.name
      expect(page).to_not have_content food1.food_category.food_category
      expect(page).to_not have_content food1.food_type.food_type
      expect(page).to_not have_content food3.name
      expect(page).to_not have_content food3.food_category.food_category
      expect(page).to_not have_content food3.food_type.food_type
    end
  end
end
