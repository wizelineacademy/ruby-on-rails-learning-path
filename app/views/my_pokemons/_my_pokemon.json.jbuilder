json.extract! my_pokemon, :abilities, :base_experience, :forms, :game_indices, :height, :held_items, :pokemon_api, :is_default, :location_area_encounters, :moves, :name, :order, :past_types, :species, :sprites, :stats, :types, :weight, :created_at, :updated_at
json.url my_pokemon_url(my_pokemon, format: :json)
