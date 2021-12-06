json.extract! my_pokemon, :id, :created_at, :updated_at
json.url my_pokemon_url(my_pokemon, format: :json)
