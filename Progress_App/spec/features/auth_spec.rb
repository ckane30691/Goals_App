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

  let!(:user) { User.create!(username: "Johnny", password: "johnnyjohnny") }

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

  let!(:user) { User.create!(username: "Johnny", password: "johnnyjohnny") }

  before(:each) do
    visit new_session_url
    fill_in 'Username', with: "Johnny"
    fill_in 'Password', with: "johnnyjohnny"
    click_on "Sign In!"
    visit goals_url
    click_on "Sign Out"
  end

  scenario 'redirects to the new_session_url upon sign out' do
    expect("http://www.example.com#{current_path}").to eq new_session_url
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).not_to have_content "Johnny"
  end

end
