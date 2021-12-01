class PokemonsController < ApplicationController
    
    def index
      @pokemons = ['pikachu','charmander','mewtwo']
    end

end
