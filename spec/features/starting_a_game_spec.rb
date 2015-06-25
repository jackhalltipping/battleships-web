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

  scenario 'Start Shooting button takes player to bomb page' do 
    click_button 'Start Shooting'
    expect(page).to have_content "Where do you place you bomb!!!"
  end

  scenario 'can bomb coordinates' do 
    click_button 'Start Shooting'
    fill_in 'coords', :with => 'A1'
    click_button 'Bomb!'
    expect(page).to have_content 'Hit'
  end

end