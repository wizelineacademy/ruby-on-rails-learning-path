class CreatePokemonMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_moves, primary_key: :id do |t|
      t.integer :external_id, null: false
      t.string :name, null: false
      t.integer :accuracy, null: false
      t.integer :power, null: false
      t.string :descriptive_name, null: false
      t.string :effect_description, null: false
      t.timestamps
    end
  end
end
