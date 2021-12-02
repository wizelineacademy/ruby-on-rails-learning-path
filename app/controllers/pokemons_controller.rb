require 'net/http'
require 'json'

class PokemonsController < ApplicationController
    
    def index
        uri = URI('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0')
        @all_pokemons = JSON.parse(Net::HTTP.get(uri))        
    end

    def profile (id: id)
        uri2 = URI.parse("https://pokeapi.co/api/v2/pokemon/#{params[:id]}") 
        @pokedata = JSON.parse(Net::HTTP.get(uri2))    
    end

end
