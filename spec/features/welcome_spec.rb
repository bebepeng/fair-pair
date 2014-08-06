require 'rails_helper'

feature 'Welcome Page' do
  scenario 'Users can visit the welcome page' do
    visit root_path
    expect(page).to have_content 'Hello and Welcome to Fair Pair!'
  end
  scenario 'Users can view an about page' do
    visit root_path
    click_on 'About Fair Pair'
    expect(page).to have_content 'Instructions'
  end
end