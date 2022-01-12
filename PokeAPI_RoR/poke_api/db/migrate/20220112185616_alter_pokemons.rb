class AlterPokemons < ActiveRecord::Migration[7.0]
  def up
    change_column 'pokemons', 'sprite_link', :string, default: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png'
  end

  def down
    change_column 'pokemons', 'sprite_link', :string
  end
end
