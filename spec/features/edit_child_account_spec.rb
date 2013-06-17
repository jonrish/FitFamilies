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

  let(:family_account) { FactoryGirl.create(:family_account) }
  let(:child_account) { FactoryGirl.create(:child_account, family_account: family_account) }

  scenario 'parent makes changes to child account' do
    sign_in_as(family_account)
    visit family_account_child_account_path(family_account, child_account) 
    click_link 'Edit My Child\'s Info'
    fill_in 'Username', with: 'Joe'
    click_button 'Submit'
    expect(page).to have_content 'Your info has been updated'
    expect(page).to have_content 'Joe'
  end

  scenario 'parent deletes a child account' do
    sign_in_as(family_account)
    visit family_account_child_account_path(family_account, child_account)
    count = ChildAccount.count
    click_link 'Edit My Child\'s Info'
    click_link 'Remove My Child From Our Account'
    expect(page).to have_content 'our child\'s information has been deleted.'
    expect(ChildAccount.count).to eql(count - 1)
  end
end