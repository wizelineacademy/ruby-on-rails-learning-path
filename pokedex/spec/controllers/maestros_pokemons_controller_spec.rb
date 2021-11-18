require 'rails_helper'

RSpec.describe MaestrosPokemonsController, type: :controller do
  before do
    @pokemon = FactoryBot.create(:pokemon)
    @maestro = FactoryBot.create(:maestro)
    login(@maestro)
  end

  describe "GET create" do
    it "create a new relation maestro/pokemon" do
        pokemon_params = {
            :pokemon_id => @pokemon.id, 
            :level => 1
        }
        get :create, params:{ maestros_pokemons: pokemon_params } 

        expect(response.body).to include("test")
      end
  end

  describe "GET destroy" do
    it "deletes relation maestro/pokemon" do
        maestro_pokemon = FactoryBot.create(:maestros_pokemons)
        old_count = MaestrosPokemons.count
        maestro_pokemon.destroy
        expect(MaestrosPokemons.count).to eq(old_count-1)
      end
  end

end