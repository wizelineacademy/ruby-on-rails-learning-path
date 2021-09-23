module PokemonModule
    
    def PokemonModule.getPokemonsForUser(user)
        data = []
        pokemons = User.find_by_id(user).pokemon_traineds
        if pokemons.nil?
            return data
        end
        pokemons.each do |p|
            item = {}
            item[:id] = p.id
            item[:is_custom] = p.pokemon.is_custom
            item[:custom_name] = p.custom_name
            item[:pokemon_data] = p.pokemon
            item[:moves] = p.pokemon_moves
            data << item
        end
        data
    end

    def PokemonModule.addNewPokemonToUser(user)
        user = User.find_by_id(user)
        if user.nil?
            return nil
        end
        
    end

end