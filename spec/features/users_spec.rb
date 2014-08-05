require 'rails_helper'

feature 'Users' do
  scenario 'Users can sign up' do
    visit root_path
    click_on 'Sign Up'
    expect(page).to have_content 'Sign Up'
    fill_in 'Name', :with => 'Sam'
    fill_in 'Email', :with => 'sam@example.com'
    fill_in 'Password', :with => 'password'
    click_on 'Submit'
    expect(page).to have_content 'Welcome, Sam!'
    expect(page).to have_no_link 'Sign Up'
  end
  scenario 'Users can log out'
  scenario 'Users can sign in'
end