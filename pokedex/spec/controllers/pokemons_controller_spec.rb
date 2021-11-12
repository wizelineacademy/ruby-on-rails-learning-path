require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  before do
    @pokemon = FactoryBot.create(:pokemon)
    @maestro = FactoryBot.create(:maestro)
    login(@maestro)
  end

  describe "GET index" do
    it "returns a 200" do
      get :index
      expect(response).to be_successful
    end

    it "renders 'index' template" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET show" do
    it "returns a 200" do
      get :show, { id: @pokemon.id } 
      expect(response).to be_successful
    end

    it "renders 'show' template" do
      get :show, { id: @pokemon.id } 
      expect(response).to render_template('show')
    end
  end

  describe "GET edit" do
    it "returns a 200" do
      get :edit, { id: @pokemon.id } 
      expect(response).to be_successful
    end

    it "renders 'edit' template" do
      get :edit, { id: @pokemon.id } 
      expect(response).to render_template('edit')
    end
  end

  describe "GET update" do
    it "returns a 200" do
      get :update, { id: @pokemon.id } 
      expect(response).to be_successful
    end

    it "renders 'update' template" do
      get :update, { id: @pokemon.id } 
      expect(response).to render_template('update')
    end
  end
end