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

Pokemon.destroy_all
Ability.destroy_all
Type.destroy_all
User.destroy_all
PokemonAbility.destroy_all
PokemonType.destroy_all

pokemons = %w(pikachu squirtle charmander bulbasaur caterpie weedle pidgey rattata spearow ekans)
@stats_allowed = ['hp', 'attack', 'defense', 'special_attack', 'special_defense', 'speed']

api = PokeApi.new

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
  p "#{new_pokemon.name} added to database"
end

trainer = User.create(
  first_name: 'Shamed',
  last_name: 'Calderon',
  email: 'shamed.calderon@pokemon.com',
  username: 'acalderon',
  password: 'pokeappadmin'
)

p "#{trainer.name} added to database"