class CreatePokemonCards < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_cards do |t|
      t.integer "pokemon_id"
      t.integer "defense", :default => 1, :null => false
      t.integer "user_id"
      t.timestamps
    end
    add_index("pokemon_cards", "pokemon_id")
    add_index("pokemon_cards", "user_id")
  end
end
