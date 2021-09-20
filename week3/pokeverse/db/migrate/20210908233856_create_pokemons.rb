class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.integer "pokeapi_id"
      t.string "name"
      t.string "image_url"
      t.timestamps
    end
    add_index("pokemons", "pokeapi_id")
    add_index("pokemons", "name")
  end
end
