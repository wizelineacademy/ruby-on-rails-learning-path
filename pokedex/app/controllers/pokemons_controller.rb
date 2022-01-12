# frozen_string_literal: true

class PokemonsController < ApplicationController
  layout 'application'

  def index
    @pokemons = MaestrosPokemons.sorted
    @maestro = Maestro.find(session[:user_id])
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.update(pokemon_params)
      redirect_to(pokemon_path(@pokemon))
    else
      render('edit')
    end
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :is_default, :order, :weight, :height, :location_area_encounters)
  end
end
