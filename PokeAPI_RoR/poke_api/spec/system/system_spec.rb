require 'rails_helper'

RSpec.describe 'Poke API', type: :system do
  before do
    driven_by(:rack_test)
  end

  context 'specs without login' do
    it 'enables me to visit main page' do
      visit root_path
      expect(page).to have_text('Please log in.')
    end

    it 'enables me to create a user' do
      visit new_user_path
      fill_in 'Username', with: 'testinguser'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'secret'
      click_button 'Create User'
      expect(page).to have_text('User created successfully.')
    end
  end

  context 'specs with login' do
    before do
      log_in
    end

    def log_in
      visit root_path
      fill_in 'Username', with: 'customuser'
      fill_in 'Password', with: 'password'
      click_button 'Login'
    end

    it 'enables me to login' do
      expect(page).to have_text('You are now logged in.')
    end

    it 'enables me to logout' do
      visit access_logout_path
      expect(page).to have_text('Logged out')
    end

    it 'enables me to visit my profile' do
      visit user_path(User.first)
      expect(page).to have_text('User Information')
    end

    it 'enables me to edit my profile' do
      visit edit_user_path(User.first)
      fill_in 'Username', with: 'modifieduser'
      click_button 'Update User'
      expect(page).to have_text('User updated successfully.')
    end

    it 'enables me to delete my profile' do
      visit delete_user_path(User.first)
      click_button 'Delete User'
      expect(page).to have_text('User destroyed successfully.')
    end

    it 'enables me to show a pokemon' do
      visit pokemon_path(Pokemon.first)
      expect(page).to have_text('Pokemon Information')
    end

    it 'enables me to edit a pokemon' do
      visit edit_pokemon_path(Pokemon.first)
      fill_in 'Name', with: 'modifiedpokemon'
      click_button 'Update Pokemon'
      expect(page).to have_text('Pokemon updated successfully.')
    end

    it 'enables me to delete a pokemon' do
      visit delete_pokemon_path(Pokemon.first)
      click_button 'Delete Pokemon'
      expect(page).to have_text('destroyed successfully.')
    end
  end
end
