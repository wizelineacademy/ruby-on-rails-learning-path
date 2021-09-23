class DashboardController < ApplicationController

  before_action :confirm_user_access
  
  def main

  end

  def pokemons
    render json: PokemonModule.getPokemonsForUser(session[:user_id])
  end

  def capture
    
  end

end
