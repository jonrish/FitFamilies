require 'spec_helper'

feature 'view list of favorite foods', %q{as a signed in parent or child 
  I want to be able to view and customize my list of favorited foods 
  so that I can see what I like.
} do

# AC
# 1) I can view a list of all the foods I've favorited. (favorite food index page)
# 2) I can search that list by name
# 3) I can sort that list by type, category and or rating
# 4) views rating along with other info
# 5) note field is not visible on the index page
# 6) must be signed in to view favorite food list

  let(:family_account) { FactoryGirl.create(:family_account) }
  let(:child_account) { FactoryGirl.create(:child_account, family_account: family_account) }
  let!(:ft) { FactoryGirl.create(:food_type, food_type: 'Protein (like Meat, Fish & Beans)') }
  let!(:fc) { FactoryGirl.create(:food_category, food_category: 'Treat') }
  let(:favorite_food) { FactoryGirl.create(:favorite_food, child_account: child_account, food_type: ft, food_category: fc) }

  scenario 'a child views their list of favorite foods' do
    sign_in_as(family_account)
    favorite_food
    visit child_account_favorite_foods_path(child_account)
    expect(page).to have_content favorite_food.name
    expect(page).to have_content favorite_food.rating
    expect(page).to_not have_content favorite_food.note
  end

  scenario 'must sign in to view favorite foods' do
    visit child_account_favorite_foods_path(child_account)
    expect(current_path).to eql family_account_session_path
  end

end
