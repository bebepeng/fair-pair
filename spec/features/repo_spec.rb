require 'rails_helper'

feature 'GitHub Repo Commit Tracker' do
  scenario 'Users can add a repo and delete it' do
    User.create!(:name => 'Sam', :email => 'sam@example.com', :password => 'password')

    visit new_sessions_path
    fill_in 'Email', :with => 'sam@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'
    VCR.use_cassette('githubapi/commits/feature') do
      click_on 'GitHub Repos'
      within '.form' do
        fill_in 'GitHub Repo', :with => 'bebepeng/single-page-app'
        click_on 'Add Repo'

        fill_in 'GitHub Repo', :with => 'bebepeng/listen_to'
        click_on 'Add Repo'
      end

      within '#repos-div' do
        expect(page).to have_content 'bebepeng/single-page-app'
        expect(page).to have_content 'bebepeng/listen_to'

        page.all('.action').last.click
      end

        expect(page).to have_no_content 'bebepeng/listen_to'
        expect(page).to have_content 'Repo Successfully Removed'
        expect(page).to have_content 'bebepeng/single-page-app'
    end
  end

  scenario 'Users cannot add an invalid repo' do
    User.create!(:name => 'Sam', :email => 'sam@example.com', :password => 'password')

    visit new_sessions_path
    fill_in 'Email', :with => 'sam@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign In'
    VCR.use_cassette('githubapi/commits/featurefail') do
      click_on 'GitHub Repos'
      within '.form' do
        fill_in 'GitHub Repo', :with => 'bebepeng/blahstuff'
        click_on 'Add Repo'
      end

      expect(page).to have_content 'Invalid Repo'
      within '#repos-div' do
        expect(page).to have_no_content 'bebepeng/blahstuff'
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