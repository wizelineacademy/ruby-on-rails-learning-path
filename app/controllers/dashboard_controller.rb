class DashboardController < ApplicationController

  before_action :confirm_user_access
  
  def main
    @pokeData = PokemonModule.getPokemonsForUser(session[:user_id])
    @pokeBallData = PokemonModule.getItemsForUser(session[:user_id])
  end

  def pokemons
    render json: PokemonModule.getPokemonsForUser(session[:user_id])
  end

  def pokeItems
    render json: PokemonModule.getItemsForUser(session[:user_id])
  end

  def capture
    user = session[:user_id]
    pokeball = params[:item_id]
    if pokeball.nil?
      render json: {error: 1, error_desc: "Missing parameters"}
      return
    end
    item = UserPokeItem.find_by_id(pokeball)
    if item.nil? || item.quantity < 1
      render json: {error: 1, error_desc: "User does not have any item with that ID"}
      return
    end
    pokemon = PokeApi.getRandomPokemon
    move = PokeApi.getRandomMove
    if pokemon.nil? || move.nil?
      render json: {error: 1, error_desc: "Error ocurred while requesting API data"}
      return
    end
    unless PokemonModule.addNewPokemonToUser(user, pokemon, move)
      render json: {error: 1, error_desc: "Server error #POKEMON_TRAINED"}
      return
    end
    result = PokemonModule.addQuantityToItem(user, item.poke_item_id, -1)
    unless result
      render json: {error: 1, error_desc: "Server error #ITEM"}
      return
    end
    render json: {success: 1, data: {pokemon: pokemon, move: move}}
  end

  def giveRandomPokeballToUser
    user = session[:user_id]
    pokeball = PokemonModule.getRandomPokeball
    result = PokemonModule.addQuantityToItem(user, pokeball.id, 1)
    unless result
      render json: {error: 1, error_desc: "Server error #ITEM"}
    else
      render json: {success: 1, data: pokeball}
    end
  end

  def saveCustomPokemon
    user = session[:user_id]
    name = params[:name]
    base_hp = params[:base_hp]
    if name.nil? || base_hp.nil?
      render json: {error: 1, error_desc: "Missing parameters"}
      return
    end
    result = PokemonModule.saveCustomPokemonForUser(user,name: name,base_hp: base_hp)
    if result.nil?
      render json: {error: 1, error_desc: "Server error #POKEMON_TRAINED"}
      return
    end
    render json: {success: 1, data: result}
  end

  def saveCustomNameForTP
    name = params[:custom_name]
    tp = params[:id]
    if name.nil? || tp.nil?
      render json: {error: 1, error_desc: "Missing parameters"}
      return
    end
    myPokemon = PokemonTrained.find_by_id(tp)
    if myPokemon.nil?
      render json: {error: 1, error_desc: "Wrong parameters"}
      return
    end
    myPokemon.custom_name = name
    unless myPokemon.save
      render json: {error: 1, error_desc: "Server error"}
      return
    else
      render json: {success: 1}
    end
  end

  def deleteCustomPokemon
    tp = params[:id]
    if tp.nil?
      render json: {error: 1, error_desc: "Missing parameters"}
      return
    end
    myPokemon = PokemonTrained.find_by_id(tp)
    if myPokemon.nil?
      render json: {error: 1, error_desc: "Wrong parameters"}
      return
    end
    unless myPokemon.destroy.destroyed?
      render json: {error: 1, error_desc: "Server error"}
      return
    else
      render json: {success: 1}
    end
  end

end
