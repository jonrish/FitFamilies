module AuthenticationHelper
  def sign_in_as(user)
    visit new_family_account_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end
