require 'rails_helper'

feature 'Pairing Timers', :js => true do
  scenario 'User can set a pomodoro' do
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

  scenario 'User can set a chess clock' do
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

  scenario 'User can choose a custom break timer' do
    visit timers_path
    click_on 'Custom Timer'
    choose 'Break Timer'
    fill_in 'Time Limit:', :with => '5'
    click_on 'Create Timer'

    expect(page).to have_content '05:00'
  end

  scenario 'User can choose a pair timer' do
    visit timers_path
    click_on 'Custom Timer'
    puts page.body
    # puts page.evaluate_script("function(){return $('some selector').html()}();")
    choose 'Pair Timer'
    fill_in 'Time Limit:', :with => '5'
    click_on 'Create Timer'

    within('div#display1') do
      expect(page).to have_content '05:00'
    end

    within('div#display2') do
      expect(page).to have_content '05:00'
    end
  end
end