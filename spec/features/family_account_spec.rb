require 'spec_helper'

# 1) I want to be able to create an account
# so I can keep track of activity and interests for me and my kids. 

feature 'a user creates a family account' do

  scenario 'a user signs up' do
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
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'a user signs in and signs out' do
    FactoryGirl.create(:family_account)
    visit family_accounts_path
    click_link 'Log In'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'Log Out'
    expect(page).to have_content 'Signed out successfully'
  end

  def sign_in
    FactoryGirl.create(:family_account)
    visit new_family_account_session_path
    click_link 'Log In'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Sign in'
  end

  scenario 'a user edits their account information' do
    sign_in
    click_link 'My Account'
    click_link 'Edit My Family Account'
    expect(page).to have_content 'You can make changes to your account here.'
    fill_in 'Email', with: 'test1@test.com'
    fill_in 'Current password', with: 'testtest'
    click_button 'Update Family Account'
    expect(page).to have_content 'You updated your account successfully.'
  end

  scenario 'a user deletes their account' do
    sign_in
    visit edit_family_account_registration_path
    click_link 'Delete My Account'
    expect(page).to have_content 'Your account has been successfully deleted.'
    expect(current_path).to eql root_path
  end

  scenario 'a user views their account info' do
    sign_in
    click_link 'My Account'
    expect(page).to have_content 'Here is all of your account information:' 
  end

  # it 'allows a user to view their account information' do
  #   visit family_account_path(family_account.id)
  #   expect(page).to have_content 'test@test.com'
  # end

  # it 'tells user if information is entered incorrectly' do
  #   visit new_family_account_path
  #   click_button 'Create/Update Family Account'
  #   expect(page).to have_content 'Let\'s get started!'
  # end

  # it 'allows a user to edit their account information' do
  #   visit edit_family_account_path(family_account.id)
  #   fill_in 'First Name', with: 'testy'
  #   click_button 'Create/Update Family Account'
  #   expect(page).to have_content 'testy'
  # end

  # it 'allows a user to delete their account' do
  #   visit edit_family_account_path(family_account.id)
  #   click_link 'Delete My Account'
  #   expect(page).to have_content 'Your account has been deleted'
  # end
end










