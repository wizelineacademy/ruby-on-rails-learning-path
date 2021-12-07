require 'net/http'
require 'json'

class PokemonsController < ApplicationController
    

    before_action:authenticate_trainer!

    def index
       @pokemons = Pokemon.all  
    
    end

    def show
        @pokemon = Pokemon.where(["name = ?" , params[:id]])   
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
