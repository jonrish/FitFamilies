require 'spec_helper'

describe 'viewing food choices' do
  before(:each) do
    fc = FactoryGirl.create(:food_category) 
    ft = FactoryGirl.create(:food_type)
    FactoryGirl.create(:food, food_category_id: fc.id, food_type_id: ft.id)
  end

  it 'allows a user to see food choices' do    
    visit foods_path
    expect(page).to have_link 'peanut butter'
  end

  it 'allowed a user to see individual food details' do
    visit foods_path
    click_link 'peanut butter'
    expect(page).to have_content 'the details'
  end
end
