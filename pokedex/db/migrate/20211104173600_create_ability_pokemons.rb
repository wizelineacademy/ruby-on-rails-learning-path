class CreateAbilityPokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :ability_pokemons do |t|
      t.integer "pokemon_id"
      t.integer "ability_id"
      t.boolean "is_hidden", :default => true
      t.integer "slot"
      t.timestamps
    end
    add_index("ability_pokemons", ["pokemon_id", "ability_id"])
  end

  def down
    drop_table :ability_pokemons
  end
end