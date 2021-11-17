class AlterAbilities < ActiveRecord::Migration[6.1]
  def up
    remove_column("abilities", "effect")
    remove_column("games", "game_index")
  end
  def down
    add_column("games", "game_index", :integer)
    add_column("abilities", "effect", :string)
  end
end
