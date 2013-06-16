require 'spec_helper'

# As a child I want to be able to have my own section of my parents'
# so I can keep track of my own stuff.

feature 'parent creates a child account' do

  def sign_in
    @fa = FactoryGirl.create(:family_account)
    visit new_family_account_session_path
    click_link 'Log In'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'testtest'
    click_button 'Sign in'
  end

  scenario 'parent adds a child account to the family account' do
    count = ChildAccount.count
    sign_in
    click_link 'My Account'
    click_link 'Add a Child'
    fill_in 'Username', with: 'test'
    click_button 'Submit'
    expect(page).to have_content 'Alright, you\'re in!'
    expect(ChildAccount.count).to eql(count + 1)
  end
  
  scenario 'parent must enter valid attributes' do
    count = ChildAccount.count
    sign_in
    visit new_family_account_child_account_path(@fa.id)
    fill_in 'Username', with: ''
    click_button 'Submit'
    expect(page).to have_content 'Username can\'t be blank'
    expect(count).to eql(ChildAccount.count)
  end
end
