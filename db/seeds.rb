# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Pokemon.destroy_all
Stat.destroy_all
Ability.destroy_all
PokemonStat.destroy_all
PokemonAbility.destroy_all

User.create(
  first_name: "Rod",
  last_name: "Cervantes",
  email: "rodrigo.delatorre@wizeline.com",
  password: "pokemon12345"
)

pokemon_catalog = [
  "pikachu", 
  "rattata", 
  "bulbasaur", 
  "squirtle", 
  "ekans", 
  "charmander"
]

pokemon_catalog.each do |name|
  poke_api = PokeApi.get(pokemon: name)

  pokemon = Pokemon.new(
    name: poke_api.name,
    height: poke_api.height,
    weight: poke_api.weight,
    base_experience: poke_api.base_experience
  )

  poke_api.abilities.each do |x|
    ability = x.ability.name
    pokemon_ability = Ability.find_by_name(ability) || Ability.create(name: ability)
    pokemon.abilities << pokemon_ability
  end

  poke_api.stats.each do |x|
    stat = x.stat.name
    pokemon_stat = Stat.find_by_name(stat) || Stat.create(name: stat)
    pokemon.stats << pokemon_stat
  end

  pokemon.save
end
