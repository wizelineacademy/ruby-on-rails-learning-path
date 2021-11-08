
json.abilities @pokemon.abilities_pokemons do |ability|
    json.name ability.ability.name
    json.is_hidden ability.is_hidden
    json.slot ability.slot
end

json.forms do
    json.name @pokemon.form.name
    json.url @pokemon.form.url
end

json.game_indices @pokemon.games_pokemons do |game|
    json.game_index game.game_index
    json.name game.game.name
    json.url game.game.url
end

json.height @pokemon.height
json.id @pokemon.pokedex_id
json.location_area_encounters @pokemon.location_area_encounters

json.moves  @pokemon.moves do |move|
    json.name move.name
    json.url move.url
end

json.name @pokemon.name
json.order @pokemon.order

json.sprites do
    json.back_default @pokemon.sprites.last.back_default
    json.back_female @pokemon.sprites.last.back_female
    json.back_shiny @pokemon.sprites.last.back_shiny
    json.back_shiny_female @pokemon.sprites.last.back_shiny_female
    json.front_default @pokemon.sprites.last.front_default
    json.front_female @pokemon.sprites.last.front_female
    json.front_shiny @pokemon.sprites.last.front_shiny
    json.front_shiny_female @pokemon.sprites.last.front_shiny_female
end

json.stats @pokemon.pokemons_stats do |stat|
    json.name stat.stat.name
    json.url stat.stat.url
    json.base_stat stat.base_stat
    json.effort stat.effort
end

json.types  @pokemon.types do |type|
    json.name type.name
    json.url type.url
end

json.weight @pokemon.weight