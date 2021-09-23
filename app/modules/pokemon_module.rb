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

    def PokemonModule.getItemsForUser(user)
        data = []
        items = User.find_by_id(user).user_poke_items
        if items.nil?
            return data
        end
        items.each do |p|
            item = {}
            item[:id] = p.id
            item[:quantity] = p.quantity
            item[:item_data] = p.poke_item
            data << item
        end
        data
    end

    def PokemonModule.addNewPokemonToUser(user_id, pokemon, move)
        user = User.find_by_id(user_id)
        if user.nil?
            return false
        end
        if pokemon.nil? || move.nil?
            return false
        end
        tp = PokemonTrained.new 
        tp.user_id = user_id
        tp.pokemon_id = pokemon.id
        unless tp.save
            return false
        end
        tp.pokemon_moves << move
        unless tp.save
            tp.destroy
            return false
        end
        true
    end

    def PokemonModule.getRandomPokeball
        available = PokeItem.where(is_pokeball: true)
        selection = rand(0..available.length-1)
        available[selection]
    end

    def PokemonModule.modifyQuantityOfItem(user_id, item_id, quantity)
        results = UserPokeItem.where(user_id: user_id, poke_item_id: item_id)
        if results.length == 0
            item = UserPokeItem.new
            item.user_id = user_id
            item.poke_item_id = item_id
        else
            item = results.first
        end
        item.quantity = quantity
        if item.quantity == 0
            item.destroy.destroyed?
        else
            item.save
        end
    end

    def PokemonModule.addQuantityToItem(user_id, item_id, quantity)
        results = UserPokeItem.where(user_id: user_id, poke_item_id: item_id)
        if results.length == 0
            item = UserPokeItem.new
            item.user_id = user_id
            item.poke_item_id = item_id
        else
            item = results.first
        end
        item.quantity = item.quantity + quantity
        if item.quantity == 0
            item.destroy.destroyed?
        else
            item.save
        end
    end

    def PokemonModule.saveCustomPokemonForUser(user_id,name:,base_hp:)
        user = User.find_by_id(user_id)
        if user.nil?
            return nil
        end
        pokemon = Pokemon.new
        pokemon.name = name
        pokemon.base_hp = base_hp
        pokemon.is_custom = true
        unless pokemon.save
            return nil
        end
        tp = PokemonTrained.new
        tp.user_id = user.id
        tp.pokemon_id = pokemon.id
        tp.custom_name = name
        unless tp.save
            return nil
        end
        data = {id: tp.id,is_custom: true, custom_name: name,pokemon_data: pokemon}
    end
end