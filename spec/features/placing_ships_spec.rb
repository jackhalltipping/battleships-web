require 'spec_helper'

feature 'Placing ships' do
  scenario 'I am asked to place my submarine' do
    visit '/newgame'
    expect(page).to have_content 'Enter your submarine coordinate'
  end

  scenario 'I can place my submarine' do
    visit '/newgame'
    fill_in('submarine_coordinate', with: 'A1')
    fill_in('submarine_direction', with: 'vertically')
    click_button 'Submit'
    expect(page).to have_content('placed your submarine')
  end

  scenario 'I am asked to place my destroyer' do
    visit '/destroyer'
    expect(page).to have_content 'Enter your destroyer coordinate'
  end

  scenario 'I can place my destroyer' do
    visit '/destroyer'
    fill_in('destroyer_coordinate', with: 'B2')
    fill_in('destroyer_direction', with: 'vertically')
    click_button 'Submit'
    expect(page).to have_content('placed your destroyer')
  end

  scenario 'I am asked to place my cruiser' do
    visit '/cruiser'
    expect(page).to have_content 'Enter your cruiser coordinate'
  end

  scenario 'I can place my cruiser' do
    visit '/cruiser'
    fill_in('cruiser_coordinate', with: 'C2')
    fill_in('cruiser_direction', with: 'vertically')
    click_button 'Submit'
    expect(page).to have_content('placed your cruiser')
  end

  scenario 'I am asked to place my battleship' do
    visit '/battleship'
    expect(page).to have_content 'Enter your battleship coordinate'
  end

  scenario 'I can place my battleship' do
    visit '/battleship'
    fill_in('battleship_coordinate', with: 'D3')
    fill_in('battleship_direction', with: 'vertically')
    click_button 'Submit'
    expect(page).to have_content('placed your battleship')
  end

  scenario 'I am asked to place my aircraft carrier' do
    visit '/aircraft_carrier'
    expect(page).to have_content 'Enter your aircraft carrier coordinate'
  end

  scenario 'I can place my aircraft carrier' do
    visit '/aircraft_carrier'
    fill_in('aircraft_carrier_coordinate', with: 'E3')
    fill_in('aircraft_carrier_direction', with: 'vertically')
    click_button 'Submit'
    expect(page).to have_content('placed your aircraft carrier')
  end
end
