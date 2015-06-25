require 'spec_helper'

feature 'Starting a new game' do

  scenario 'Starts a new game' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name player1?"
  end

  # scenario 'New game page accepts player 1 name' do
  #   visit '/new_game1'
  #   fill_in 'name1', :with => 'David'
  #   click_button 'Submit'
  #   expect(page).to have_content 'Welcome, David'
  # end

  scenario 'New game page accepts player 1 and 2 names' do
    visit '/new_game1'
    fill_in 'name1', :with => 'David'
    click_button 'Submit'
    visit '/new_game2'
    fill_in 'name2', :with => 'David'
    click_button 'Submit'
    expect(page).to have_content 'Welcome, David and David'
  end

  scenario 'New page can\'t accept a empty form' do
    visit '/new_game1'
    click_button 'Submit'
    expect(page).to have_content "What's your name player1?"
  end

    scenario 'New page can\'t accept a empty form' do
    visit '/new_game2'
    click_button 'Submit'
    expect(page).to have_content "What's your name player2?"
  end

  scenario 'Let\'s Go! starts a new game and loads a board' do
    visit '/start_game'
    click_button 'Let\'s Go!'
    expect(page).to have_content "ABCDEF"
  end

  scenario 'place a ship' do
    visit '/start_game'
    click_button 'Let\'s Go!'
    select 'Battleship', :from => 'ship'
    fill_in 'coords', :with => 'A1'
    fill_in 'direction', :with => 'horizontally'
    click_button 'submit'
    expect(page).to have_content "BBBB"
  end

  scenario 'player2 can view his board' do
    visit '/player2board'
    expect(page).to have_content "Place your ships"
  end

end

feature 'Start shooting at opponents ships' do 
  before (:each) do
    visit '/start_game'
    click_button 'Let\'s Go!'
    select 'Battleship', :from => 'ship'
    fill_in 'coords', :with => 'A1'
    fill_in 'direction', :with => 'horizontally'
    click_button 'submit'
  end

  scenario 'Takes players to a new shhoting phase' do 
    visit '/player2board'
    click_button 'Go to firing phase'
    expect(page).to have_content "Where do you place you bomb!!!"
  end

  scenario 'player hits' do
    visit '/firing'
    fill_in('coordinate', with: 'A1')
    click_button 'Fire'
    expect(page).to have_content "Hit!"
  end

  scenario 'player misses' do
    visit '/firing'
    fill_in('coordinate', with: 'B1')
    click_button 'Fire'
    expect(page).to have_content "Miss!"
  end

end