require 'rails_helper'

feature 'Pairing Timers' do
  scenario 'User can set a pomodoro', :js => true do
    visit root_path
    click_on 'Use Timers'

    click_on 'Pomodoro Timer'
    expect(page).to have_content '25:00'

    click_on 'Start'
    sleep 2
    click_on 'Pause'
    expect(page).to have_content '24:58'
    expect(page).to have_no_content '25:00'

    click_on 'Reset'
    expect(page).to have_content '25:00'
  end

  scenario 'User can set a chess clock', :js => true do
    visit root_path
    click_on 'Use Timers'

    click_on 'Chess Clock'
    within('div#display1') do
      expect(page).to have_content '25:00'
    end
    within('div#display2') do
      expect(page).to have_content '25:00'
    end

    click_on 'Start'
    sleep 2
    click_on 'Switch'
    within('div#display1') do
      expect(page).to have_content '24:58'
    end

    sleep 2
    click_on 'Switch'
    within('div#display2') do
      expect(page).to have_content '24:58'
    end
    click_on 'Reset'

    within('div#display1') do
      expect(page).to have_content '25:00'
    end
    within('div#display2') do
      expect(page).to have_content '25:00'
    end
  end
end