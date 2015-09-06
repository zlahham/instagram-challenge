require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Sign Up'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'User name', with: 'monkey123'
      fill_in 'Email', with: 'monkey@jungle.com'
    fill_in 'Password', with: '12345678', match: :first
    fill_in 'Password confirmation', with: '12345678'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end
end