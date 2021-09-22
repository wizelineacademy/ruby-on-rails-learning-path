module PokeApi
    POKE_ITEMS_URL = "https://pokeapi.co/api/v2/item-category/27"
    POKE_BALLS_URL = "https://pokeapi.co/api/v2/item-category/34"
    POKE_MONS_URL = "https://pokeapi.co/api/v2/pokemon?limit=2000"
    POKE_MON_URL = "https://pokeapi.co/api/v2/pokemon"
    POKE_MOVES_URL = "https://pokeapi.co/api/v2/move-damage-class/2/"
    POKE_MOVE_URL = "https://pokeapi.co/api/v2/move"

    def PokeApi.seedPokeItems
        data = PokeApi.makeRequestTo(POKE_ITEMS_URL)
        unless data == nil
            data[:items.to_s].each do |item|
                itemData = PokeApi.makeRequestTo(item[:url.to_s])
                if itemData == nil
                    next
                end
                itemRecord = PokeItem.new
                itemRecord.external_id = itemData[:id.to_s]
                itemRecord.name = itemData[:name.to_s].gsub("-"," ").capitalize
                itemRecord.effect_description = "Restores HP"
                itemRecord.is_potion = true
                itemRecord.image_route = itemData[:sprites.to_s][:default.to_s]
                itemRecord.healing_hp = itemData[:cost.to_s]
                itemRecord.save
            end
            true            
        else
            false
        end
    end

    def PokeApi.seedPokeBalls
        data = PokeApi.makeRequestTo(POKE_BALLS_URL)
        unless data == nil
            data[:items.to_s].each do |item|
                itemData = PokeApi.makeRequestTo(item[:url.to_s])
                if itemData == nil
                    next
                end
                itemRecord = PokeItem.new
                itemRecord.external_id = itemData[:id.to_s]
                itemRecord.name = itemData[:name.to_s].gsub("-"," ").capitalize
                itemRecord.effect_description = "Catches pokemon"
                itemRecord.is_pokeball = true
                itemRecord.image_route = itemData[:sprites.to_s][:default.to_s]
                itemRecord.save
            end
            true            
        else
            false
        end
    end

    def PokeApi.seedData
        PokeApi.seedPokeItems & PokeApi.seedPokeBalls
    end

    def PokeApi.makeRequestTo(url)
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Get.new(uri, {'Content-Type' => 'application/json'})      
        response = http.request(request)
        begin
            JSON.parse(response.body)
        rescue JSON::ParserError
            nil
        end
    end

    def PokeApi.getRandomPokemon(excluding = 0)
        data = PokeApi.makeRequestTo(POKE_MONS_URL)
        totalPokemons = data[:count.to_s] - 1
        selection = rand(0..totalPokemons)
        pokeSelectionId = data[:results.to_s][selection][:url.to_s].match(/\/(\d+)\//).captures.first.to_i
        pokemon = Pokemon.find_by external_id: pokeSelectionId
        if pokemon.nil?
            pokemon = PokeApi.downloadPokemonData(pokeSelectionId)
        end
        pokemon
    end

    def PokeApi.getRandomMove(excluding = 0)
        data = PokeApi.makeRequestTo(POKE_MOVES_URL)
        totalMoves = data[:moves.to_s].length - 1
        selection = rand(0..totalMoves)
        moveSelectionId = data[:moves.to_s][selection][:url.to_s].match(/\/(\d+)\//).captures.first.to_i
        move = Pokemon.find_by external_id: moveSelectionId
        if move.nil?
            move = PokeApi.downloadMoveData(moveSelectionId)
        end
        move
    end

    def PokeApi.downloadPokemonData(id)
        url = "#{POKE_MON_URL}/#{id}"
        data = PokeApi.makeRequestTo(url)
        unless data == nil
            pokemon = Pokemon.new
            pokemon.external_id = data[:id.to_s]
            pokemon.name = data[:name.to_s].capitalize
            pokemon.image_route = data[:sprites.to_s][:front_default.to_s]
            pokemon.base_hp = data[:stats.to_s].select{|el| el[:stat.to_s][:name.to_s] == "hp"}.first[:base_stat.to_s]
            if pokemon.save
                pokemon
            else
                nil
            end
        else
            nil
        end
    end

    def PokeApi.downloadMoveData(id)
        url = "#{POKE_MOVE_URL}/#{id}"
        data = PokeApi.makeRequestTo(url)
        unless data == nil
            move = PokemonMove.new
            move.external_id = data[:id.to_s]
            move.name = data[:name.to_s].gsub("-"," ").capitalize
            move.accuracy = data[:accuracy.to_s]
            move.power = data[:power.to_s]
            move.descriptive_name = data[:name.to_s].gsub("-"," ").capitalize
            texts = data[:flavor_text_entries.to_s]
            move.effect_description = texts.length == 0 ? move.name : texts.select{|el| el[:language.to_s][:name.to_s] == "en"}.first[:flavor_text.to_s]
            if move.save
                move
            else
                nil
            end
        else
            nil
        end
    end

end