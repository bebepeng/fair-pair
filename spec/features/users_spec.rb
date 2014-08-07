require 'rails_helper'

feature 'Users' do
  scenario 'Users can sign up and sign out' do
    visit root_path
    click_on 'Sign Up'

    fill_in 'Name', :with => 'Sam'
    fill_in 'Email', :with => 'sam@example.com'
    fill_in 'Password', :with => 'password'
    click_on 'Submit'

    expect(page).to have_content 'Welcome, Sam!'
    expect(page).to have_no_link 'Sign Up'
    click_on 'Sign Out'

    expect(page).to have_link 'Sign Up'
  end

  scenario 'Users can sign in and sign out' do
    User.create!(:name => 'Sam', :email => 'sam@example.com', :password => 'password')

    visit root_path
    expect(page).to have_no_link 'Sign Out'
    click_on 'Sign In'

    fill_in 'Email', :with => 'sam@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'

    expect(page).to have_content 'Welcome back, Sam!'
    expect(page).to have_no_link 'Sign Up'
    expect(page).to have_no_link 'Sign In'
    click_on 'Sign Out'

    expect(page).to have_link 'Sign Up'
    expect(page).to have_link 'Sign In'
  end

  scenario 'Users cannot sign in with invalid email/password combo' do
    User.create!(:name => 'Sam', :email => 'sam@example.com', :password => 'password')

    visit root_path
    expect(page).to have_no_link 'Sign Out'
    click_on 'Sign In'

    fill_in 'Email', :with => 'sam@example.com'
    fill_in 'Password', :with => 'notpassword'
    click_button 'Sign In'

    expect(page).to have_no_content 'Welcome back, Sam!'
    expect(page).to have_content 'Invalid Email/Password Combination'

    fill_in 'Email', :with => 'someone@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'

    expect(page).to have_no_content 'Welcome back'
    expect(page).to have_content 'Invalid Email/Password Combination'
  end

  scenario 'Users cannot sign up with previously registered email' do
    User.create!(:name => 'Sam', :email => 'sam@example.com', :password => 'password')
    visit root_path
    click_on 'Sign Up'

    fill_in 'Name', :with => 'Sam'
    fill_in 'Email', :with => 'sam@example.com'
    fill_in 'Password', :with => 'password'
    click_on 'Submit'
    expect(page).to have_content 'User already exists'
  end
end