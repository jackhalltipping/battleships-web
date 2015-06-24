require 'spec_helper'

feature 'Placing ships' do
  scenario 'I am asked to place my submarine' do
    visit '/newgame'
    expect(page).to have_content 'Place your submarine'
  end

  scenario 'I am asked to place my destroyer' do
    visit '/newgame'
    expect(page).to have_content 'Place your destroyer'
  end

  scenario 'I am asked to place my cruiser' do
    visit '/newgame'
    expect(page).to have_content 'Place your cruiser'
  end

  scenario 'I am asked to place my battleship' do
    visit '/newgame'
    expect(page).to have_content 'Place your battleship'
  end

  scenario 'I am asked to place my aircraft_carrier' do
    visit '/newgame'
    expect(page).to have_content 'Place your aircraft carrier'
  end

  scenario 'I can place my submarine' do
    visit '/newgame'
    fill_in('submarine_direction', with: vertically)
    click_button 'Submit'
    expect(page).to have_content('fire')
  end

  scenario 'I can place my destroyer' do
    visit '/newgame'
    fill_in('destroyer_coordinate', with: A1)
    fill_in('destroyer_direction', with: vertically)
    click_button 'Submit'
    expect(page).to have_content('fire')
  end
end
