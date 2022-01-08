class CreateUsersPokemonJoin < ActiveRecord::Migration[7.0]
  def up
    create_table :users_pokemon, :id => false do |t|
      t.integer "user_pokemon_id"
      t.integer "pokemon_id"
    end
    add_index("users_pokemon", ["user_pokemon_id", "pokemon_id"])
  end

  def down
    drop_table :users_pokemon
  end

end
