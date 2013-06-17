module AuthenticationHelper
  def sign_in_as(user)
    visit new_family_account_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  def create_child_account(user,child)
    visit new_family_account_child_account_path(user)
    fill_in 'Username', with: child.username
    click_button 'Submit'
  end
end
