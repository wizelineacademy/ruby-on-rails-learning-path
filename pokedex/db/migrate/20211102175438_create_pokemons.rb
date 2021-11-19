# frozen_string_literal: true

class CreatePokemons < ActiveRecord::Migration[6.1]
  def up
    create_table :pokemons do |t|
      t.integer 'height', default: 1
      t.integer 'pokedex_id', null: false
      t.boolean 'is_default', default: true
      t.string 'location_area_encounters', limit: 50
      t.string 'name', limit: 40, null: false
      t.integer 'order', default: 1
      t.integer 'weight', default: 1
      t.timestamps
    end
  end

  def down
    drop_table :pokemons
  end
end
