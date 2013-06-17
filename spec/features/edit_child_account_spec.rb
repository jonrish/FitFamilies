require 'spec_helper'

feature 'modify child account', %q{ as a parent
  I want to be able to modify or remove my child's account 
  so that i can keep information accurate.
  } do

  # AC
  # 1) parent can edit child's info or remove the child account 
  # completely from the child's edit page. 
  # 2) if account is updated or deleted redirect to family account 
  # show page / notify user

  # def sign_in
  #   @fa = FactoryGirl.create(:family_account)
  #   visit new_family_account_session_path
  #   click_link 'Log In'
  #   fill_in 'Email', with: 'test@test.com'
  #   fill_in 'Password', with: 'testtest'
  #   click_button 'Sign in'
  # end

  let(:family_account) { FactoryGirl.create(:family_account) }
  let(:child_account) { FactoryGirl.create(:child_account, family_account: family_account) }

  scenario 'parent makes changes to child account' do
    sign_in_as(family_account)
    create_child_account(family_account,child_account)
    click_link 'Edit My Child\'s Info'
    fill_in 'Username', with: 'Joe'
    click_button 'Submit'
    expect(page).to have_content 'Your info has been updated'
    expect(page).to have_content 'Joe'
  end

  scenario 'parent deletes a child account' do
    sign_in_as(family_account)
    create_child_account(family_account,child_account)
    count = ChildAccount.count
    click_link 'Edit My Child\'s Info'
    click_link 'Remove My Child From Our Account'
    expect(page).to have_content 'our child\'s information has been deleted.'
    expect(ChildAccount.count).to eql(count - 1)
  end
end