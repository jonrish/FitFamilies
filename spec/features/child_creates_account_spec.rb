require 'spec_helper'

# As a child I want to be able to have my own section of my parents'
# so I can keep track of my own stuff.

describe 'creating a child account' do

  let(:family_account) { FactoryGirl.create(:family_account) }

  it 'allows a child to create an account' do
    visit new_family_account_child_account_path(family_account.id)
    fill_in 'Username', with: 'Junior'
    click_button 'Register Child Account'
    expect(page).to have_content 'Junior'
  end
end