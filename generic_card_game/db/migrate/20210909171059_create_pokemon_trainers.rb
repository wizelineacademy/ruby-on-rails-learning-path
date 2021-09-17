class CreatePokemonTrainers < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_trainers do |t|
      t.string :name

      t.timestamps
    end
  end
end
