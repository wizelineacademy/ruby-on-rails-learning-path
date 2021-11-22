class PokeApi
  include HTTParty
  base_uri 'https://pokeapi.co/api/v2'

  def get_pokemon(name:)
    raise ArgumentError, 'You must provide a pokemon name' if name.empty? || name.nil?
    self.class.get("/pokemon/#{name}")
  end
end