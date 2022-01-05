class CreatePokemonCardTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_card_tokens do |t|
      t.integer "pokemon_card_id"
      t.integer "type_id"
      t.timestamps
    end
    add_index("pokemon_card_tokens", "pokemon_card_id")
    add_index("pokemon_card_tokens", "type_id")
  end
end
