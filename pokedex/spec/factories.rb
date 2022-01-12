# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    id { 1000 }
    pokedex_id { 1000 }
    location_area_encounters { 'https://pokeapi.co/api/v2/pokemon/1/encounters' }
    name { 'test' }
  end
end

FactoryBot.define do
  factory :maestro do
    id { 2 }
    name { 'Ash' }
    email { 'test@test.com' }
    region { 'test region' }
    hometown { 'test town' }
    picture { 'https://pokemon.fandom.com/wiki/Ash_Ketchum?file=Ash_anime_The_Beginning_Gold_and_Silver.png' }
    password { 'test' }
  end
end

FactoryBot.define do
  factory :maestros_pokemons do
    pokemon_id { 1000 }
    maestro_id { 2 }
    level { 100 }
  end
end
