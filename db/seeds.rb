# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pokemons = [{name: "Example1"}, {name: "Example2"}, {name: "Example3"}]

pokemons.each_with_index do |pokemon, i|
	attrs = {
    name: pokemon[:name]
    base_hp: 10
    base_exp: 10
    weight: 10
    height: 10
    pokemon_api_id: 9999 + (i+1)
  }

  Pokemon.create(attrs)
end
