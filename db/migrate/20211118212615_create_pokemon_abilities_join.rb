class CreatePokemonAbilitiesJoin < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons_abilities, :id => false do |t|
      t.integer :ability_id
      t.integer :pokemon_id
      t.boolean :is_hidden
      t.timestamps
    end
    add_index :pokemons_abilities, [:ability_id, :pokemon_id]
  end

  def down 
    drop_table :pokemons_abilities
  end
end
