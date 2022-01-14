class CreatePokemonsUsersJoin < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons_users, id: false do |t|
      t.integer 'user_id'
      t.integer 'pokemon_id'
    end
    add_index :pokemons_users, %i[user_id pokemon_id]
  end
end
