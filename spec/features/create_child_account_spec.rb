require 'spec_helper'

# As a child I want to be able to have my own section of my parents'
# so I can keep track of my own stuff.

# AC
# 1) when a parent is logged in they can create a separate section for each of their interested children
# 2) link to create from family account show page
# 3) create account on child account new page
# 4) child account must have a username, gender & date of birth
# 5) parent is notified if their child's account is successfully created
# 6) if successful redirect back to the child account show page
# 7) if account creation is not successful prompt to try again

feature 'parent creates a child account' do

  let(:family_account) { FactoryGirl.create(:family_account) }

  scenario 'parent adds a child account to the family account' do
    count = ChildAccount.count
    sign_in_as(family_account)
    click_link 'My Account'
    click_link 'Add a Child'
    fill_in 'Username', with: 'test'
    click_button 'Submit'
    expect(page).to have_content 'Alright, you\'re in!'
    expect(ChildAccount.count).to eql(count + 1)
    expect(current_path).to eql(family_account_child_account_path(family_account, ChildAccount.last))
  end
  
  scenario 'parent must enter valid attributes' do
    count = ChildAccount.count
    sign_in_as(family_account)
    visit new_family_account_child_account_path(family_account)
    fill_in 'Username', with: ''
    click_button 'Submit'
    expect(page).to have_content 'Username can\'t be blank'
    expect(page).to have_content 'Please try again.'
    expect(count).to eql(ChildAccount.count)
  end
end
