# frozen_string_literal: true

json.array! @my_pokemons, partial: 'my_pokemons/my_pokemon', as: :my_pokemon
