class PokemonsController < ApplicationController
  
  layout 'user'

  LIMIT = 5

  before_action :confirm_logged_in

  def index
    @pokemons = Pokemon.sorted
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def load_new_pokemon
    last = Pokemon.all.size == 0 ? 0 : Pokemon.order("pokeapi_id DESC").first.pokeapi_id
    if last < Pokemon.max_pokemon
      end_limit = (last + LIMIT) > Pokemon.max_pokemon ? Pokemon.max_pokemon : last + LIMIT
      (last+1..end_limit).each do |id|
        pokemon = PokeApi.get(pokemon: id)
        pokemon_record = Pokemon.create(
          :pokeapi_id => pokemon.id,
          :name => pokemon.name,
          :image_url => pokemon.sprites.front_default
        )
        pokemon.moves.each do |tmp_move|
          if Move.where(:name => tmp_move.move.name).empty?
            move = PokeApi.get(move: tmp_move.move.name)
            move_record = Move.create(
              :pokeapi_id => move.id,
              :name => move.name
            )
          else 
            move_record = Move.where(:name => tmp_move.move.name).first
          end
          pokemon_record.moves << move_record
        end
        pokemon_record.save
      end
    end
    redirect_to(pokemons_path)
  end
end
