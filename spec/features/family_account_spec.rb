require 'spec_helper'

# As a parent 
# I want to be able to create an account
# so I can keep track of activity and interests for me and my children.

#ACC
# 1) user signs up for account
# 2) user must enter email, password, first name, last name, date of birth and zip code
# 3) user may sign in to account - notified if signed in
# 4) user may sign out of account - notified if signed out
# 5) user may view their account information
# 6) user may edit account information
# 7) user may delete their account

feature 'a user creates a family account' do

  let(:family_account) { FactoryGirl.create(:family_account) }

  scenario 'a user signs up' do
    count = FamilyAccount.count
    visit family_accounts_path
    click_link 'Sign Up Today!'
    expect(page).to have_content 'Let\'s get started!'
    fill_in "Email", with: "testy@test.com"
    fill_in "Password", with: '12345678'
    fill_in "Password confirmation", with: '12345678'
    fill_in "First Name", with: "test"
    fill_in "Last Name", with: "test"
    fill_in "Zip Code", with: "12345"
    select 'January', from: 'family_account_date_of_birth_2i'
    select '1', from: 'family_account_date_of_birth_3i'
    select '2000', from: 'family_account_date_of_birth_1i'
    click_button "Create Family Account"
    expect(FamilyAccount.count).to eql(count + 1)
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'a user signs in and signs out' do
    visit family_accounts_path
    click_link 'Log In'
    fill_in 'Email', with: family_account.email
    fill_in 'Password', with: family_account.password
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'Log Out'
    expect(page).to have_content 'Signed out successfully'
  end

  scenario 'a user edits their account information' do
    sign_in_as(family_account)
    click_link 'My Account'
    click_link 'Edit My Account'
    expect(page).to have_content 'Make changes here'
    fill_in 'Email', with: 'test1@test.com'
    fill_in 'Current password', with: 'testtest'
    click_button 'Update Family Account'
    expect(page).to have_content 'You updated your account successfully.'
    expect(page).to have_content 'test1@test.com'
  end

  scenario 'a user deletes their account' do
    sign_in_as(family_account)
    visit edit_family_account_registration_path
    count = FamilyAccount.count
    click_link 'Delete My Account'
    expect(page).to have_content 'Your account has been successfully deleted.'
    expect(current_path).to eql root_path
    expect(FamilyAccount.count).to eql(count - 1)
  end

  scenario 'a user views their account info' do
    sign_in_as(family_account)
    click_link 'My Account'
    expect(page).to have_content 'Here is all of your account information:' 
    expect(page).to have_content family_account.email
  end
end
