require 'spec_helper'

# As a child I want to be able to have my own section of my parents'
# so I can keep track of my own stuff.

describe 'creating a child account' do

  let(:family_account) { FactoryGirl.create(:family_account) }

  it 'allows a user to create,edit and delete a child\'s account' do
    visit new_family_account_child_account_path(family_account.id)
    fill_in 'Username', with: 'Junior'
    click_button 'Register/Update Child Account'
    expect(page).to have_content 'Junior'
    click_link 'Edit My Child\'s Info'
    expect(page).to have_content 'Feel Free to make any changes' 
    click_link 'Remove My Child From Our Account'
    expect(page).to have_content 'Your child\'s information has been deleted'
  end
end
