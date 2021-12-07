class RefreshService
    def call
    #   p api_pokemons
    api_pokemons.each do |api_pokemon| 
      pokemon = Pokemon.new
      pokemon.name = api_pokemon["name"]
      pokemon.abilities = api_pokemon["abilities"]
      pokemon.base_experience = api_pokemon["base_experience"]
      pokemon.forms = api_pokemon["forms"]
      pokemon.game_indices = api_pokemon["game_indices"]
      pokemon.height = api_pokemon["height"]
      pokemon.held_items = api_pokemon["held_items"]
      pokemon.pokemon_api = api_pokemon["id"]
      pokemon.sprites = api_pokemon["sprites"]["front_default"]
      pokemon.is_default = api_pokemon["is_default"]
      pokemon.location_area_encounters = api_pokemon["location_area_encounters"]
      pokemon.moves = api_pokemon["moves"]
      pokemon.order = api_pokemon["order"]
      pokemon.past_types = api_pokemon["past_types"]
      pokemon.species = api_pokemon["species"]
      pokemon.sprites = api_pokemon["sprites"]
      pokemon.stats = api_pokemon["stats"]
      pokemon.types = api_pokemon["types"]
      pokemon.weight = api_pokemon["weight"]
      pokemon.save 
    end
  end
    private
    
    def api_pokemon_names
        uri = 'https://pokeapi.co/api/v2/pokemon?limit=2000&offset=0'
        parsed_response = http_get(uri)
        parsed_response["results"].map {|api_pokemon| api_pokemon["name"]}
        
    end

    def api_pokemons
        api_pokemon_names.map do |api_pokemon_name|
            uri = "https://pokeapi.co/api/v2/pokemon/#{api_pokemon_name}"
            http_get(uri)
        end
    end

    def http_get(uri)
        response = Net::HTTP.get(URI(uri))
        JSON.parse(response)
    end

end