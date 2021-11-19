# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  before do
    @pokemon = FactoryBot.create(:pokemon)
    @maestro = FactoryBot.create(:maestro)
    login(@maestro)
  end

  describe 'GET index' do
    it 'returns a 200' do
      get :index
      expect(response).to be_successful
    end

    it "renders 'index' template" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'returns a 200' do
      get :show, params: { id: @pokemon.id }
      expect(response).to be_successful
    end

    it "renders 'show' template" do
      get :show, params: { id: @pokemon.id }
      expect(response).to render_template('show')
    end
  end

  describe 'GET edit' do
    it 'returns a 200' do
      get :edit, params: { id: @pokemon.id }
      expect(response).to be_successful
    end

    it "renders 'edit' template" do
      get :edit, params: { id: @pokemon.id }
      expect(response).to render_template('edit')
    end
  end

  describe 'GET update' do
    pokemon_params = {
      name: 'snorlax',
      is_default: true,
      order: 1,
      weight: 1,
      height: 1,
      location_area_encounters: 'https://pokeapi.co/api/v2/pokemon/1/encounters'
    }
    it 'returns a 200' do
      get :update, params: { id: @pokemon.id, pokemon: pokemon_params }
      expect(response).to be_successful
    end

    it "renders 'update' template" do
      get :update, params: { id: @pokemon.id, pokemon: pokemon_params }
      expect(response).to render_template('edit')
    end
  end
end
