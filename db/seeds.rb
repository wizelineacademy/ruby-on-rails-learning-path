require 'poke_api'

def add_stats pokemon:, stats:
  stats.each do |stat|
    stat_name = stat['stat']['name'].gsub('-', '_')
    pokemon[stat_name] = stat['base_stat'] if @stats_allowed.include?(stat_name)
  end
end

def add_types pokemon:, types:
  types.each do |fetched_type|
    tmp_type = fetched_type['type']['name']
    pokemon_type = Type.find_by_name(tmp_type) || Type.create(name: tmp_type)
    pokemon.types << pokemon_type
  end
end

def add_abilities pokemon:, abilities:
  abilities.each do |ability|
    tmp_ability = ability['ability']['name']
    pokemon_ability = Ability.find_by_name(tmp_ability) || Ability.create(name: tmp_ability)
    pokemon.abilities << pokemon_ability
  end
end

def get_all_abilities api:, offset: 100, limit: 100
  response = api.get_abilities(offset: offset, limit: limit)
  pokemon_abilities = response["results"]

  if !pokemon_abilities.empty?
    pokemon_abilities.concat(get_all_abilities(api: api, offset: offset + 100))
  else
    pokemon_abilities
  end
end

def delete_abilities_and_types
  pokemons = Pokemon.all
  
  pokemons.each do |pokemon|
    pokemon.abilities.each do |p_ability|
      pokemon.abilities.delete(p_ability)
    end

    pokemon.types.each do |p_type|
      pokemon.types.delete(p_ability)
    end
  end
end

delete_abilities_and_types
p "Relationships cleaned"

Pokemon.destroy_all
p "pokemons table cleaned"
Ability.destroy_all
p "abilities table cleaned"
Type.destroy_all
p "types table cleaned"
User.destroy_all
p "users table cleaned"

pokemons = %w(pikachu squirtle charmander bulbasaur caterpie weedle pidgey rattata spearow ekans)
@stats_allowed = ['hp', 'attack', 'defense', 'special_attack', 'special_defense', 'speed']

api = PokeApi.new

pokemon_types = api.get_types
pokemon_types['results'].each do |p_type|
  Type.create(name: p_type['name'])
end
p "#{Type.count} types added to types table"

pokemon_abilities = get_all_abilities(api: api)
pokemon_abilities.each do |p_ability|
  Ability.create(name: p_ability['name'])
end
p "#{Ability.count} abilitites added to abilities table"

pokemons.each do |pokemon|
  response = api.get_pokemon(name: pokemon)
  stats = response['stats']
  types = response['types']
  abilities = response['abilities']

  new_pokemon = Pokemon.new(
    name: response['name'],
    sprite: response['sprites']['front_default'],
    base_experience: response['base_experience'],
    height: response['height'],
    is_default: response['is_default'],
    weight: response['weight'],
  )

  add_stats(pokemon: new_pokemon, stats: stats)
  add_types(pokemon: new_pokemon, types: types)
  add_abilities(pokemon: new_pokemon, abilities: abilities)

  new_pokemon.save
  p "#{new_pokemon.name} added to pokemons table"
end

trainer = User.create(
  first_name: 'Shamed',
  last_name: 'Calderon',
  email: 'shamed.calderon@pokemon.com',
  username: 'acalderon',
  password: 'pokeappadmin'
)

p "#{trainer.name} added to database"