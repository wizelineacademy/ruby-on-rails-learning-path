module PokemonHelper
  def add_stats pokemon:, stats:
    stats.each do |stat|
      stat_name = stat['stat']['name'].gsub('-', '_')
      pokemon[stat_name] = stat['base_stat'] if @stats_allowed.include?(stat_name)
    end
  end
  
  def add_types pokemon:, types:
    types.each do |fetched_type|
      tmp_type = fetched_type['type']['name']
      pokemon_type = Type.find_by_name(tmp_type) || Type.create(name: tmp_type)
      pokemon.types << pokemon_type
    end
  end
  
  def add_abilities pokemon:, abilities:
    abilities.each do |ability|
      tmp_ability = ability['ability']['name']
      pokemon_ability = Ability.find_by_name(tmp_ability) || Ability.create(name: tmp_ability)
      pokemon.abilities << pokemon_ability
    end
  end
end
