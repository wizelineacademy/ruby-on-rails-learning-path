class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :base_hp
      t.string :base_exp
      t.float :weight
      t.float :height
      t.integer :pokemon_api_id

      t.timestamps
    end
  end
end
