class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.sorted
  end

  def show
    @pokemon = Pokemon.find(params[:id])
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
