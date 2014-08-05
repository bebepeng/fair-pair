require 'rails_helper'

feature 'GitHub Repo Commit Tracker' do
  scenario 'Users can add a repo' do
    User.create!(:name => 'Sam', :email => 'sam@example.com', :password => 'password')

    visit new_sessions_path
    fill_in 'Email', :with => 'sam@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'
    VCR.use_cassette('githubapi/commits') do
      click_on 'GitHub Repos'
      within '.form' do
        fill_in 'GitHub Repo', :with => 'bebepeng/single-page-app'
        click_on 'Add Repo'
      end

      within '#repos-div' do
        expect(page).to have_content 'bebepeng/single-page-app'
      end
    end
  end

  scenario 'Users must log in to use GitHub Repo Commit Tracker' do
    visit root_path
    click_on 'GitHub Repos'
    expect(page).to have_content 'Please sign in to use this feature.'
    expect(page).to have_no_button 'Add Repo'
  end
end