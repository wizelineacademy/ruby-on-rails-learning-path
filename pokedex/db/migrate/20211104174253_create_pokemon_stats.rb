class CreatePokemonStats < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemon_stats do |t|
      t.integer "pokemon_id"
      t.integer "stat_id"
      t.integer "base_stat"
      t.integer "effort"
      t.timestamps
    end
    add_index("pokemon_stats", ["pokemon_id", "stat_id"])
  end

  def down
    drop_table :pokemon_stats
  end
end