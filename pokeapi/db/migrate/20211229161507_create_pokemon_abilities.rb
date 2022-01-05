class CreatePokemonAbilities < ActiveRecord::Migration[7.0]
  def up
    create_table :pokemon_abilities do |t|
      t.integer :pokemon_id
      t.integer :ability_id
      t.timestamps
    end
    add_index :pokemon_abilities, [:pokemon_id, :ability_id]
  end

  def down
    drop_table :pokemon_abilities
  end
end
