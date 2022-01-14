require 'rails_helper'

RSpec.describe 'pokemons', type: :request do
  # Create post request to login
  before :all do
    post access_attempt_login_path(username: 'customuser', password: 'password')
  end

  let(:pokemon) { Pokemon.first }

  it 'shows a pokemon' do
    get pokemon_path(pokemon)
    expect(response).to have_http_status(200)
    expect(response.body).to include 'Custom pokemon 0'
  end

  it 'shows all pokemons' do
    get pokemons_path
    expect(response).to have_http_status(200)
  end

  it 'edit a pokemon' do
    get edit_pokemon_path(pokemon)
    expect(response).to have_http_status(200)
  end

  it 'delete a pokemon' do
    get delete_pokemon_path(pokemon)
    expect(response).to have_http_status(200)
  end

  it 'create a pokemon' do
    get new_pokemon_path
    expect(response).to have_http_status(200)
  end
end
