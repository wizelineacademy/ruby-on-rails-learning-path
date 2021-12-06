class CreateMyPokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :my_pokemons do |t|

      t.timestamps
    end
  end
end
