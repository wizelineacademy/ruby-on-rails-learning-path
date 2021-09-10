class CreatePokemonTrainersPokemonCards < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_cards_trainers do |t|
      t.references :pokemon_trainer, null: false, foreign_key: true
      t.references :pokemon_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
