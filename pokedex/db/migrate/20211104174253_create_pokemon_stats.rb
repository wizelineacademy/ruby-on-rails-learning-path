class CreatePokemonStats < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons_stats do |t|
      t.integer "pokemon_id"
      t.integer "stat_id"
      t.integer "base_stat"
      t.integer "effort"
      t.timestamps
    end
    add_index("pokemons_stats", ["pokemon_id", "stat_id"])
  end

  def down
    drop_table :pokemons_stats
  end
end