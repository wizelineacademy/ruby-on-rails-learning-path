class AddTrainerIdToMyPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :my_pokemons, :trainer_id, :integer
  end
end
