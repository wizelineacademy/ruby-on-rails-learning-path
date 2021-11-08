class CreateAbilityPokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :abilities_pokemons do |t|
      t.integer "pokemon_id"
      t.integer "ability_id"
      t.boolean "is_hidden", :default => true
      t.integer "slot"
      t.timestamps
    end
    add_index("abilities_pokemons", ["pokemon_id", "ability_id"])
  end

  def down
    drop_table :abilities_pokemons
  end
end