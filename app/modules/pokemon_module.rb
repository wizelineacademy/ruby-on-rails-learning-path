module PokemonModule
    
    def PokemonModule.getPokemonsForUser(user)
        pokemons 
    end

    def PokemonModule.addNewPokemonToUser(user)
        user = User.find_by_id(user)
        if user.nil?
            return nil
        end
        
    end

end