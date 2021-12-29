class CreatePokemonAbilities < ActiveRecord::Migration[7.0]
  def up
    create_table :pokemons_abilities do |t|
      t.integer :pokemon_id
      t.integer :ability_id
      t.timestamps
    end
    add_index :pokemons_abilities, [:pokemon_id, :ability_id]
  end

  def down
    drop_table :pokemons_abilities
  end
end
