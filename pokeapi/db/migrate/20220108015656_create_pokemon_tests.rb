class CreatePokemonTests < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_tests do |t|
      t.string :name

      t.timestamps
    end
  end
end
