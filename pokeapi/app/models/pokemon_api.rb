class PokemonApi
    def self.to_json
      pokemons = []
  
      response = HTTParty.get("https://pokeapi.co/api/v2/pokemon?limit=6&offset=1")
      response = JSON.parse(response.body)
      response.each do |k, value|
        if k == "results"
          value.each do |key, val|
            response = HTTParty.get(key["url"])
            response = JSON.parse(response.body)
            pokemons.push(response)
          end
        end
      end
    end
end