class PokeApi
  include HTTParty
  base_uri 'https://pokeapi.co/api/v2'

  def get_pokemon(name:)
    raise ArgumentError, 'You must provide a pokemon name' if name.empty? || name.nil?
    self.class.get("/pokemon/#{name}")
  end

  def get_types
    self.class.get("/type")
  end

  def get_abilities(**kwargs)
    @options = { query: {} }

    if kwargs[:offset]
      @options[:query][:offset] = kwargs[:offset]
    end

    if kwargs[:limit]
      @options[:query][:limit] = kwargs[:limit]
    end

    self.class.get("/ability", @options)
  end
end