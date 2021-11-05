class CreatePokemons < ActiveRecord::Migration[6.1]

  def up
    create_table :pokemons do |t|
      t.integer "height"
      t.integer "pokedex_id", :null => false
      t.boolean "is_default", :default => true
      t.string "location_area_encounters"
      t.string "name", :limit => 40, :null => false
      t.integer "order"
      t.integer "weight"
      t.timestamps
    end
  end
  
  def down
    drop_table :pokemons
  end
end
