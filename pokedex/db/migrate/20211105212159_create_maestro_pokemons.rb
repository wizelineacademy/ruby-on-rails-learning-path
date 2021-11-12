class CreateMaestroPokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :maestros_pokemons do |t|
      t.integer "pokemon_id", :null => false
      t.integer "maestro_id", :null => false
      t.integer "level", :default => 1, :null => false
      t.timestamps
    end
    add_index("maestros_pokemons", ["pokemon_id", "maestro_id"])
  end
  def down
    drop_table :maestros_pokemons
  end
end
