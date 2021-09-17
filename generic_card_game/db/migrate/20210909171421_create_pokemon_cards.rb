class CreatePokemonCards < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_cards do |t|
      t.string :card_id
      t.string :name
      t.string :rarity
      t.string :image_url
      t.string :supertype
      t.timestamps
    end
  end
end
