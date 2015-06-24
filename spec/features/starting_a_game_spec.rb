require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    visit '/name'
    expect(page).to have_content "what's your name?"
  end

  scenario 'Stays on the same page if player doesnt enter his name' do
    visit '/name'
    click_button 'Submit'
    expect(page).to have_content "what's your name?"
  end

  scenario 'Registers player 1 and prints a board' do
    visit '/name'
    fill_in('player1', with: 'Jack')
    click_button 'Submit'
    click_link 'Start your game'
    expect(page).to have_content 'Jack'
    expect(page).to have_content('ABCD')
  end
end
