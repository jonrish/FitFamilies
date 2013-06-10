require 'spec_helper'

# 1) I want to be able to create an account
# so I can keep track of activity and interests for me and my kids. 

describe 'a user creates a family account' do

  let(:family_account) { FactoryGirl.create(:family_account) }

  it 'allows user to sign up' do
    visit new_family_account_path

    fill_in "Email", with: "testy@test.com"
    fill_in "Password", with: "testest"
    fill_in "First Name", with: "test"
    fill_in "Last Name", with: "test"
    fill_in "Zip Code", with: "12345"
    select 'January', from: 'family_account_date_of_birth_2i'
    select '1', from: 'family_account_date_of_birth_3i'
    select '2000', from: 'family_account_date_of_birth_1i'

    click_button "Create/Update Family Account"
    expect(page).to have_content 'Welcome to the Family!'
  end

  it 'allows a user to view their account information' do
    visit family_account_path(family_account.id)
    expect(page).to have_content 'test@test.com'
  end

  it 'tells user if information is entered incorrectly' do
    visit new_family_account_path
    click_button 'Create/Update Family Account'
    expect(page).to have_content 'Let\'s get started!'
  end

  it 'allows a user to edit their account information' do
    visit edit_family_account_path(family_account.id)
    fill_in 'First Name', with: 'testy'
    click_button 'Create/Update Family Account'
    expect(page).to have_content 'testy'
  end

  it 'allows a user to delete their account' do
    visit edit_family_account_path(family_account.id)
    click_link 'Delete My Account'
    expect(page).to have_content 'Your account has been deleted'
  end
end










