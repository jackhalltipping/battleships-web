require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    visit '/name'
    expect(page).to have_content "What's your name?"
  end

  scenario 'Stays on the same page if player doesnt enter his name' do
    visit '/name'
    click_button 'Submit'
    expect(page).to have_content "What's your name?"
  end

  scenario 'Goes to new page if you add a name' do
    visit '/name'
    fill_in('name', with: 'Jack')
    click_button 'Submit'
    expect(page).to have_content "Hello"
  end

  # scenario 'Register a second player' do
  #   visit '/name'
  #   fill_in('name', with: 'Jack')
  #   click_button 'Submit'
  #   fill_in('name2', with: '50Cent')
  #   expect(page).to have_content "50Cent"
  # end

end
