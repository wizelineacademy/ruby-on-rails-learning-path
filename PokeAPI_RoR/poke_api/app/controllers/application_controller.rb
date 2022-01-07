class ApplicationController < ActionController::Base
  before_action :set_pokemons

  # Set pokemons from API and add them to the db.
  # TODO: not use PokeApi gem wrapper.
  def set_pokemons
    # Request API call only if there's not enough records in db.
    # use of an arbitrary number of records, because why not...
    if Pokemon.all.count < 20
      20.times do
        add_pokemon_to_db(pokemon: PokeApi.get(pokemon: rand(1..248)))
      end
    end
  end

  private

  # Adds the pokemon object information to the db.
  # current method does not follow ABC size. Split this definition somehow ?
  def add_pokemon_to_db(pokemon:)
    unless Pokemon.exists?(pokedex_id: pokemon.id)
      new_pokemon = Pokemon.create(name: pokemon.name, base_experience: pokemon.base_experience, height: pokemon.height,
                                   weight: pokemon.weight, pokedex_id: pokemon.id)
      new_pokemon.abilities.create(pokemon_id: new_pokemon.id, name: pokemon.abilities.first.ability.name)
      new_pokemon.moves.create(pokemon_id: new_pokemon.id, name: pokemon.moves.first.move.name)
      new_pokemon.types.create(pokemon_id: new_pokemon.id, name: pokemon.types.first.type.name)
    end
  end
end
