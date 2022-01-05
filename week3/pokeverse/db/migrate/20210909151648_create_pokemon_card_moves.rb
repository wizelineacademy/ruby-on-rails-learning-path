class CreatePokemonCardMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_card_moves do |t|
      t.integer "pokemon_card_id"
      t.integer "move_id"
      t.integer "cost", :default => 1, :null => false
      t.integer "type_id"
      t.boolean "is_ability", :default => false, :null => false
      t.timestamps
    end
    add_index("pokemon_card_moves", "pokemon_card_id")
    add_index("pokemon_card_moves", "move_id")
  end
end
