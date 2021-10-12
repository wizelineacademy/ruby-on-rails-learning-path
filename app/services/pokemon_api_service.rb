class PokemonApiService
	def initialize(pokemon)
		@pokemon = pokemon
	end

  def get_info
    url = 'https://pokeapi.co/api/v2/pokemon/'

    response = HTTParty.get(url + @pokemon)

    response
  end
end
