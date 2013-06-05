require 'spec_helper'

# 1) I want to be able to create an account
# so I can keep track of activity and interests for me and my kids. 

describe 'a user creates a family account' do

  it 'allows user to sign up' do
    visit new_family_account_path

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "testest"
    fill_in "First name", with: "test"
    fill_in "Last name", with: "test"
    fill_in "Zip code", with: "test"
    fill_in "Date of birth", with: "01-01-2001"

    click_button "Create Family account"
    save_and_open_page
    expect(page).to have_content "Welcome to the Family!"
  end
end