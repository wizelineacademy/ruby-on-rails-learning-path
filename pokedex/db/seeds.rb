require "./lib/request_api"

def create_abilities(abilities, pokemon)
    abilities.each do |a|
        ability = Ability.find_by(name: a['ability']['name'])
        if ability
            join = AbilitiesPokemon.new(
                :is_hidden => a['is_hidden'], 
                :slot => a['slot'], 
                :pokemon => pokemon, 
                :ability => ability
            )
            join.save
        end
    end
end


def create_forms(forms, pokemon)
    form = Form.new(name: forms[0]['name'], url: forms[0]['url'])
    pokemon.form = form
end

def create_games(games, pokemon)
    games.each do |g|

        game = Game.find_by(name: g['version']['name'])
        if game
            join = GamesPokemon.new(:game_index => g['game_index'], :pokemon => pokemon, :game => game)
            join.save
        end
    end
end

def create_moves(moves, pokemon)
    obj_moves = []
    moves.each do |m|
        move = Move.find_by(name: m['move']['name'])
        if move
            obj_moves.push(move)                
        end
    end
    pokemon.moves << obj_moves
end

def create_sprites(sprites, pokemon)
    sprites_names = [:back_default, :back_female, :back_shiny, :back_shiny_female, 
        :front_default, :front_female, :front_shiny, :front_shiny_female]
    params = sprites_names.map{|k| [k, sprites[k.to_s]]}.to_h
    sprite = Sprite.new(**params)
    pokemon.sprites << sprite
end

def create_stats(stats, pokemon)
    stats.each do |s|
        stat = Stat.find_by(name: s['stat']['name'])
        if stat
            join = PokemonsStat.new(:base_stat => s['base_stat'], :effort => s['effort'], :pokemon => pokemon, :stat => stat)
            join.save
        end
    end
end

def create_types(types, pokemon)
    objs = []
    types.each do |t|
        type = Type.find_by(name: t['type']['name'])
        if type
            objs.push(type)
        end
    end
    pokemon.types << objs    
end

def seed_type(type_class, url, params={name: "name", url: "url"})
    request = RequestAPI.new(url)
    records = request.all()

    records.each do |a|
        db_params = params.map { |k, v| [k, a[v]]}.to_h
        type_class.create(**db_params)
    end
end

def seed_pokemons(url)
    request = RequestAPI.new(url)

    # get only first generation pokemons
    limit = 150
    
    (1..limit).each do |id|
        # call pokemon info
        response = request.get_record(id)
        
        pokemon = Pokemon.create(height: response['height'], 
            pokedex_id: response['id'], 
            is_default: response['is_default'], 
            location_area_encounters: response['location_area_encounters'], 
            name: response['name'],
            order: response['order'],
            weight: response['weight']
        )

        # create abilities
        abilities = response['abilities']
        create_abilities(abilities, pokemon)

        # create forms
        forms = response['forms']
        create_forms(forms, pokemon)

        # create games
        games = response['game_indices']
        create_games(games, pokemon)

        # create moves
        moves = response['moves']
        create_moves(moves, pokemon)

        # create sprites
        sprites = response['sprites']
        create_sprites(sprites, pokemon)

        # get stats
        stats = response['stats']
        create_stats(stats, pokemon)

        # get types
        types = response['types']
        create_types(types, pokemon)

    end
end

def seed_maestros()
    ash = Maestro.create(
        name: "Ash Ketchum",
        email: "ash@test.com",
        region: "Kanto",
        hometown: "Pallet Town",
        picture: "https://pokemon.fandom.com/wiki/Ash_Ketchum?file=Ash_anime_The_Beginning_Gold_and_Silver.png",
        password: "pass"
    )

    pokemons = []
    names = ['pikachu', 'bulbasaur', 'snorlax']

    names.each do |n|
        pokemon = Pokemon.find_by(name: n)
        if pokemon
            join = MaestrosPokemons.new(:level => 1, :pokemon => pokemon, :maestro => ash)
            join.save
        end
    end
end

# seed abilities
url = "https://pokeapi.co/api/v2/ability/"
seed_type(Ability, url)

# seed games
url = "https://pokeapi.co/api/v2/version/"
seed_type(Game, url)

# seed moves
url = "https://pokeapi.co/api/v2/move/"
seed_type(Move, url)

# seed stats
url = "https://pokeapi.co/api/v2/stat/"
seed_type(Stat, url)

# seed types
url = "https://pokeapi.co/api/v2/type/"
seed_type(Type, url)

# seed pokemons
url = "https://pokeapi.co/api/v2/pokemon/"
seed_pokemons(url)

# seed maestros
seed_maestros()
