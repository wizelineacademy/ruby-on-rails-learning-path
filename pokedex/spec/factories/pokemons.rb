FactoryBot.define do
    factory :pokemon do
        pokedex_id 1000
        location_area_encounters "https://pokeapi.co/api/v2/pokemon/1/encounters"
        name "test"
    end
  end