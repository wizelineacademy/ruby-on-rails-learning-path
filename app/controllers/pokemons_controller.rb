class PokemonsController < ApplicationController
	def index
		@pokemons = Pokemon.all
	end

  def new
    @pokemon = Pokemon.new
  end

  def create
    
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end
