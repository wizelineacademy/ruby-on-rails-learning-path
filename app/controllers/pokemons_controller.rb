require 'net/http'
require 'json'

class PokemonsController < ApplicationController
    

    before_action:authenticate_trainer!

    def index
        uri = URI('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0')
        @all_pokemons = JSON.parse(Net::HTTP.get(uri))        
    end

    def profile (id: id)
        uri2 = URI.parse("https://pokeapi.co/api/v2/pokemon/#{params[:id]}") 
        @pokedata = JSON.parse(Net::HTTP.get(uri2))    
    end

    def show
        uri2 = URI.parse("https://pokeapi.co/api/v2/pokemon/#{params[:id]}") 
        @pokedata = JSON.parse(Net::HTTP.get(uri2))    
    end

    def new
    end

    def create 
    end

    def edit
    end

    def update
    end

    def delete
    end

    def destroy
    end

end
