class AlterPokemon < ActiveRecord::Migration[7.0]
  def up
    add_column("pokemons", "img", :string, :limit => 100, :after => "weight")
  end

  def down
    remove_column("pokemons", "img")
  end
end
