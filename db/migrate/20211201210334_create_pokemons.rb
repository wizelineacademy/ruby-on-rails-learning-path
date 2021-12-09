# frozen_string_literal: true

# Migrate to creare Pokemons model
class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.timestamps
    end
  end
end
