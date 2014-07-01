require 'rails_helper'

feature 'Welcome Page' do
  scenario '' do
    visit root_path
    expect(page).to have_content 'Hello and Welcome to Fair Pair!'
  end
end