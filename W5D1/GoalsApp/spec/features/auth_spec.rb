require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content("Sign Up")
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      visit new_user_url
      fill_in "Username", with: "user2"
      fill_in "Password", with: "password"
      click_on "Create User"

      expect(page).to have_content("user2")
    end

  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    visit new_user_url
    fill_in "Username", with: "user2"
    fill_in "Password", with: "password"
    click_on "Create User"

    expect(page).to have_content("user2")
  end

end

feature "logging out" do

  scenario "begins with a logged out state" do
    visit new_user_url
    expect(page).to have_content("Sign In")
  end

  scenario "doesn't show username on the homepage after logout" do
    visit new_user_url
    fill_in "Username", with: "user2"
    fill_in "Password", with: "password"
    click_on "Create User"
    click_on "Sign Out"

    expect(page).to_not have_content("user2")
  end
end
