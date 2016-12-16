require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign up"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => "testing_username"
      fill_in 'email', :with => "testing_email"
      fill_in 'password', :with => "biscuits"
      click_on "Sign up"
    end

    scenario "redirects to user page after signup" do
      expect(page).to have_content "This is the profile of"
      expect(page).to have_link "Back to Index"
    end

    scenario "shows username on the userpage after signup" do
      expect(page).to have_content "This is the profile of testing_username"
      expect(page).to have_link "Back to Index"
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => "testing_username"
      click_on "Sign up"
    end

    scenario "re-renders the signup page if an invalid user is given" do
      expect(page).to have_content "Sign up"
      expect(page).to have_button "Sign up"
    end
  end

end
