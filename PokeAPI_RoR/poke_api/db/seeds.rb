# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create 10 random custom pokemons.
user = User.create(username: 'customuser', email: 'custom@gmail.com', password: 'password')
10.times do |i|
  pokemon = Pokemon.new(name: "Custom Pokemon #{i}", sprite_link: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png',
                        base_experience: rand(1..120), height: rand(3..20),
                        weight: rand(20..1000), pokedex_id: 248 + i)
  pokemon.abilities.new(pokemon_id: pokemon.id, name: "Custom ability #{i}")
  pokemon.moves.new(pokemon_id: pokemon.id, name: "Custom move #{i}")
  pokemon.types.new(pokemon_id: pokemon.id, name: "Custom type #{i}")
  pokemon.save
  user.pokemons << pokemon
end
