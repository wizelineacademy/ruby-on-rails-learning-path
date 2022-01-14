class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name, limit: 25
      t.string :sprite_link
      t.integer :base_experience
      t.integer :height
      t.integer :weight
      t.integer :pokedex_id
      t.timestamps
    end
  end
end
