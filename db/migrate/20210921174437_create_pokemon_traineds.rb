class CreatePokemonTraineds < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon_traineds, primary_key: :id do |t|
      t.string :custom_name, null: true
      t.references :user
      t.references :pokemon
      t.timestamps
    end
  end
end
