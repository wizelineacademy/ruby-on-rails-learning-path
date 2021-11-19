# frozen_string_literal: true

class MaestrosPokemonsController < ApplicationController
  def new
    @maestro_pokemon = MaestrosPokemons.new({ level: 1 })
  end

  def create
    @maestro_pokemon = MaestrosPokemons.new(pokemon_params)
    @maestro_pokemon.maestro_id = session[:user_id]
    if @maestro_pokemon.save
      redirect_to(pokemons_path)
    else
      render('new')
    end
  end

  def delete
    @maestro_pokemon = MaestrosPokemons.find_by(pokemon_id: params[:format], maestro_id: session[:user_id])
  end

  def destroy
    @maestro_pokemon = MaestrosPokemons.find(params[:id])
    @maestro_pokemon.destroy
    redirect_to(pokemons_path)
  end

  def pokemon_params
    params.require(:maestros_pokemons).permit(:level, :pokemon_id, :maestro_id)
  end
end
