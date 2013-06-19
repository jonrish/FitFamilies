require 'spec_helper'

feature 'user views favorite food details', %q{
  As a parent or child 
  I want to be able to see the details of foods I've added to 
  my list of favorites so that I can keep track of all my 
  favorite food info.
} do

# AC
# 1) view details from favorite food show page
# 2) display all available fields, name, category, type, rating, note , share with others
# 3) user must be signed in

  let(:family_account) { FactoryGirl.create(:family_account) }
  let(:child_account) { FactoryGirl.create(:child_account, family_account: family_account) }
  let!(:ft) { FactoryGirl.create(:food_type, food_type: 'Protein (like Meat, Fish & Beans)') }
  let!(:fc) { FactoryGirl.create(:food_category, food_category: 'Treat') }
  let(:favorite_food) { FactoryGirl.create(:favorite_food, child_account: child_account, food_type: ft, food_category: fc) }


  scenario 'non signed in user tries to view details of selected favorite food' do
    visit child_account_favorite_food_path(child_account, favorite_food)
    expect(current_path).to eql(new_family_account_session_path)
    expect(page).to have_content 'You need to sign in'
  end

  scenario 'a signed in user views favorite food details' do
    sign_in_as(family_account)
    visit child_account_favorite_food_path(child_account, favorite_food)
    expect(page).to have_content 'Here are the details for this favorite.'
    expect(page).to have_content favorite_food.name
    expect(page).to have_content ft.food_type
    expect(page).to have_content fc.food_category
    expect(page).to have_content favorite_food.rating
    expect(page).to have_content favorite_food.note
    expect(page).to have_content 'You chose to share this favorite with others'
  end
end
