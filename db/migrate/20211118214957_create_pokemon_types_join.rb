class CreatePokemonTypesJoin < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons_types, :id => false do |t|
      t.integer :pokemon_id
      t.integer :type_id
      t.timestamps
    end
    add_index :pokemons_types, [:pokemon_id, :type_id]
  end

  def down 
    drop_table :pokemons_types
  end
end
