require 'net/http'
require 'json'

class PokemonsController < ApplicationController
    
    def index
        uri = URI('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0')
        @all_pokemons = JSON.parse(Net::HTTP.get(uri))["results"]   

 
        uri2 = URI('https://pokeapi.co/api/v2/pokemon/ditto')
         @datos = JSON.parse(Net::HTTP.get(uri2))["sprites"]["front_default"]  

 
   

    end

    def image
 
    end

end
