require 'rails_helper'

feature 'Pairing Timers' do
  scenario 'User can set a pomodoro', :js => true do
    visit root_path
    click_on 'Use Timers'
    click_on 'Set a Pomodoro'
    expect(page).to have_content '25:0'
    click_on 'Start'
    sleep 5
    click_on 'Pause'
    expect(page).to have_no_content '25:0'
    click_on 'Reset'
    expect(page).to have_content '25:0'
  end
end