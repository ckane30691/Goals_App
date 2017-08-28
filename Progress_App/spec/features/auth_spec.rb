require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature 'signing up a user' do

    before(:each) do
      visit new_user_url
      fill_in 'Username', with: "Johnny"
      fill_in 'Password', with: "johnnyjohnny"
      click_on "Sign Up!"
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content "Hi Johnny"
    end

  end
end

feature 'logging in' do

  before(:each) do
    visit new_session_url
    fill_in 'Username', with: "Johnny"
    fill_in 'Password', with: "johnnyjohnny"
    click_on "Sign In!"
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content "Hi Johnny"
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    expect(page).to have_content "Sign In"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).not_to have_content "Johnny"
  end

end
