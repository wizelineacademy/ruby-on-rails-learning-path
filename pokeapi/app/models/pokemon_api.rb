class PokemonApi
    def self.to_json
        pokemons = []
        response = HTTParty.get("https://pokeapi.co/api/v2/pokemon?limit=20&offset=0")
        response = JSON.parse(response.body)
        response.each do |k, value|
            if k == "results"
                value.each do |key, val|
                response = HTTParty.get(key["url"])
                response = JSON.parse(response.body)
                puts key["url"]  
                pokemons.push(response)
                end
            end
        end

        pokemons.map do |poke|
            puts poke['sprites']['other']['dream_world']["front_default"]
            puts poke['base_experience']
            puts poke['forms'][0]['name']
            puts poke['weight']
            puts poke['height']
            pokeinserted = Pokemon.create(
                name: poke['forms'][0]['name'],
                base_experience: poke['base_experience'],
                height: poke['height'],
                weight: poke['weight'],
                img: poke['sprites']['other']['dream_world']["front_default"],
                pokemon_id: poke['id']
            )
            abilities = poke['abilities']
            stats = poke['stats']
            abilities.map do |ability|
                response = HTTParty.get(ability['ability']["url"])
                abilityinserted=Ability.create(
                    name: ability['ability']['name'],
                    ability_id: response["id"]
                )
                puts pokeinserted
                puts abilityinserted
                newpa = PokemonAbility.new(
                    ability: abilityinserted,
                    pokemon: pokeinserted
                )
                newpa.save
            end
            stats.map do |stat|
                response = HTTParty.get(stat['stat']["url"])
                statinserted=Stat.create(
                    name: stat['stat']['name'],
                    stat_id: response["id"]
                )
                news=PokemonStat.new(
                    pokemon: pokeinserted,
                    stat: statinserted
                )
                news.save
            end

            # abilities.map do |ability|
            #     response = HTTParty.get(ability['ability']["url"])
            #     if Ability.where(:ability_id => response["id"]).blank?
            #         # no truck record for this id
            #         abilityinserted=Ability.create(
            #             name: ability['ability']['name'],
            #             ability_id: response["id"]
            #         )
            #         newpa = PokemonAbility.new(
            #             ability_id: abilityinserted.ability_id,
            #             pokemon_id: pokeinserted.pokemon_id
            #         )
            #         newpa.save
            #     else
            #         # at least 1 record for this truck
            #         newpa = PokemonAbility.new(
            #             ability_id: response["id"],
            #             pokemon_id: pokeinserted.pokemon_id
            #         )
            #         newpa.save
            #     end

            # end
            # stats.map do |stat|
            #     response = HTTParty.get(stat['stat']["url"])
            #     if Stat.where(:stat_id => response["id"]).blank?
            #         # no truck record for this id
            #         statinserted=Stat.create(
            #             name: stat['stat']['name'],
            #             stat_id: response["id"]
            #         )
            #         news=PokemonStat.new(
            #             stat_id: response["id"],
            #             pokemon_id: pokeinserted.pokemon_id
            #         )
            #         puts news.save
            #     else
            #         # at least 1 record for this truck
            #         newps = PokemonStat.new(
            #             stat_id: response["id"],
            #             pokemon_id: pokeinserted.pokemon_id
            #         )
            #         puts newps.save
            #     end
            # end
        end
    end
end